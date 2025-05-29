import 'dart:io';
import 'package:dartz/dartz.dart' as reminder;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/features/reminders/data/models/reminder.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/drug_reminder_view_body_if_first_time.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/durg_reminder_view_body_if_not_first_time.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class DrugReminderView extends StatefulWidget {
  const DrugReminderView({super.key});

  @override
  State<DrugReminderView> createState() => _DrugReminderViewState();
}

class _DrugReminderViewState extends State<DrugReminderView> {
  List<Reminder> reminders = [];
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    super.initState();
    _initializeNotifications();
    _loadReminders();
  }

  Future<void> _initializeNotifications() async {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    const initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initializationSettingsIOS = DarwinInitializationSettings();
    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
    tz.initializeTimeZones();

    // Request iOS notification permissions
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(alert: true, badge: true, sound: true);
  }

  Future<void> _scheduleNotification(Reminder reminder) async {
    if (reminder.time.isEmpty) return;

    try {
      final timeParts = reminder.time.split(':');
      final hour = int.parse(timeParts[0]);
      final minute = int.parse(timeParts[1].split(' ')[0]);
      final isPM = reminder.time.contains('مساءً');
      final adjustedHour = isPM && hour != 12 ? hour + 12 : (!isPM && hour == 12 ? 0 : hour);

      for (int i = 0; i < 7; i++) {
        if (reminder.daysSelected[i]) {
          await flutterLocalNotificationsPlugin.zonedSchedule(
            (reminder.id.hashCode + i).abs(),
            'تذكير الدواء: ${reminder.drugName}',
            'تناول ${reminder.dosage} ${reminder.mealTiming}',
            _nextInstanceOfDay(i, adjustedHour, minute),
            const NotificationDetails(
              android: AndroidNotificationDetails(
                'reminder_channel',
                'Drug Reminders',
                importance: Importance.high,
                priority: Priority.high,
              ),
              iOS: DarwinNotificationDetails(),
            ),
            androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
            matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
          );
        }
      }
    } catch (e) {
      print('Error scheduling notification: $e');
    }
  }

  tz.TZDateTime _nextInstanceOfDay(int dayOfWeek, int hour, int minute) {
    final now = tz.TZDateTime.now(tz.local);
    var scheduledDate = tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);
    final targetDay = (dayOfWeek + 1) % 7; // Flutter: 0=Sunday, we use 0=Monday
    while (scheduledDate.weekday != targetDay + 1 || scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  Future<void> _cancelNotifications(String reminderId) async {
    try {
      for (int i = 0; i < 7; i++) {
        await flutterLocalNotificationsPlugin.cancel((reminder.id.hashCode + i).abs());
      }
    } catch (e) {
      print('Error canceling notifications: $e');
    }
  }

  Future<void> _loadReminders() async {
    final prefs = await SharedPreferences.getInstance();
    final reminderJson = prefs.getString('reminders');
    if (reminderJson != null) {
      setState(() {
        reminders = Reminder.fromJsonList(reminderJson);
      });
      for (var reminder in reminders) {
        await _scheduleNotification(reminder);
      }
    }
  }

  Future<void> _saveReminders() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('reminders', Reminder.toJsonList(reminders));
  }

  void addReminder(Reminder reminder) {
    setState(() {
      reminders.add(reminder);
    });
    _saveReminders();
    _scheduleNotification(reminder);
  }

  void updateReminder(Reminder updatedReminder) {
    setState(() {
      final index = reminders.indexWhere((r) => r.id == updatedReminder.id);
      if (index != -1) {
        reminders[index] = updatedReminder;
      } else {
        reminders.add(updatedReminder);
      }
    });
    _saveReminders();
    _cancelNotifications(updatedReminder.id);
    _scheduleNotification(updatedReminder);
  }

  void deleteReminder(String id) async {
    final reminder = reminders.firstWhere(
      (r) => r.id == id,
      orElse: () => Reminder(
        id: '',
        drugName: '',
        frequency: '',
        dosage: '',
        time: '',
        mealTiming: '',
        stopDate: '',
        daysSelected: [],
      ),
    );
    if (reminder.imagePath != null && File(reminder.imagePath!).existsSync()) {
      try {
        await File(reminder.imagePath!).delete();
      } catch (e) {
        print('Failed to delete image: $e');
      }
    }
    setState(() {
      reminders.removeWhere((r) => r.id == id);
    });
    _saveReminders();
    _cancelNotifications(id);
  }

  Future<void> clearAllReminders() async {
    for (var reminder in reminders) {
      if (reminder.imagePath != null && File(reminder.imagePath!).existsSync()) {
        try {
          await File(reminder.imagePath!).delete();
        } catch (e) {
          print('Failed to delete image: $e');
        }
        await _cancelNotifications(reminder.id);
      }
    }
    setState(() {
      reminders.clear();
    });
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('reminders');
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.greyLightColor,
        appBar: customAppbar(context, title: 'منبهات الدواء', isBack: true),
        body: reminders.isEmpty
            ? DrugReminderViewBodyIfFirstTime(
                onAddReminder: addReminder,
              )
            : DrugReminderViewBodyIfNotFirstTime(
                reminders: reminders,
                onUpdateReminder: updateReminder,
                onDeleteReminder: deleteReminder,
                onClearAllReminders: clearAllReminders,
              ),
      ),
    );
  }
}