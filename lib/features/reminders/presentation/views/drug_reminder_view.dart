// lib/features/reminders/presentation/views/drug_reminder_view.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smile_simulation/core/services/local_notification_service.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/features/reminders/data/models/reminder.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/drug_reminder_view_body_if_first_time.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/durg_reminder_view_body_if_not_first_time.dart';
import 'package:timezone/timezone.dart' as tz;
// import 'package:intl/intl.dart';

class DrugReminderView extends StatefulWidget {
  const DrugReminderView({super.key});

  @override
  State<DrugReminderView> createState() => _DrugReminderViewState();
}

class _DrugReminderViewState extends State<DrugReminderView> {
  List<Reminder> reminders = [];

  @override
  void initState() {
    super.initState();
    _loadReminders();
    // Test notification on view load
    LocalNotificationService.showTestNotification();
  }

  Future<void> _scheduleNotification(Reminder reminder) async {
    if (reminder.time.isEmpty || reminder.daysSelected.every((selected) => !selected)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى تحديد وقت ويوم واحد على الأقل')),
      );
      return;
    }

    try {
      // Parse time
      final parsedTime = DateFormat.jm('ar').parse(reminder.time);
      final hour = parsedTime.hour;
      final minute = parsedTime.minute;

      for (int i = 0; i < 7; i++) {
        if (reminder.daysSelected[i]) {
          final notificationId = (reminder.id.hashCode + i).abs();
          final scheduledDate = _nextInstanceOfDay(i, hour, minute);
          await LocalNotificationService.scheduleReminderNotification(
            id: notificationId,
            title: 'تذكير الدواء: ${reminder.drugName}',
            body: 'تناول ${reminder.dosage} ${reminder.mealTiming}',
            scheduledDate: scheduledDate,
            payload: reminder.id,
          );
        }
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تم جدولة التذكير بنجاح')),
      );
    } catch (e) {
      print('Error scheduling notification: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('فشل في جدولة التذكير')),
      );
    }
  }

  tz.TZDateTime _nextInstanceOfDay(int dayOfWeek, int hour, int minute) {
    final now = tz.TZDateTime.now(tz.local);
    var scheduledDate = tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);
    final targetDay = (dayOfWeek + 1) % 7; // 0=Monday
    while (scheduledDate.weekday != (targetDay == 0 ? 7 : targetDay) || scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  Future<void> _cancelNotifications(String reminderId) async {
    try {
      for (int i = 0; i < 7; i++) {
        final notificationId = (reminderId.hashCode + i).abs();
        await LocalNotificationService.cancelNotification(notificationId);
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
      }
      await _cancelNotifications(reminder.id);
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