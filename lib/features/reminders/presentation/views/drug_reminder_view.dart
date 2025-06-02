// lib/features/reminders/presentation/views/drug_reminder_view.dart
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smile_simulation/core/services/local_notification_service.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/features/reminders/data/models/drug_reminder.dart';
import 'package:smile_simulation/features/reminders/presentation/views/add_new_drug_view.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/drug_reminder_view_body_if_first_time.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/durg_reminder_view_body_if_not_first_time.dart';
import 'package:timezone/timezone.dart' as tz;


class DrugReminderView extends StatefulWidget {
  const DrugReminderView({super.key});

  @override
  State<DrugReminderView> createState() => _DrugReminderViewState();
}

class _DrugReminderViewState extends State<DrugReminderView> {
  List<DrugReminder> reminders = [];

  @override
  void initState() {
    super.initState();
    _loadReminders();
    log('Navigated to DrugReminderView, triggering test notification');
    LocalNotificationService.showTestNotification();
  }

  Future<void> _scheduleNotification(DrugReminder reminder) async {
    log('Attempting to schedule notification for reminder: ${reminder.toJson()}');

    // Validate inputs
    if (reminder.drugName.isEmpty) {
      log('Error: Drug name is empty');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى إدخال اسم الدواء')),
      );
      return;
    }
    if (reminder.time.isEmpty) {
      log('Error: Reminder time is empty');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى تحديد وقت التذكير')),
      );
      return;
    }
    if (reminder.daysSelected.isEmpty || reminder.daysSelected.every((selected) => !selected)) {
      log('Error: No days selected');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى اختيار يوم واحد على الأقل')),
      );
      return;
    }

    try {
      // Parse time
      log('Parsing time: ${reminder.time}');
      final parsedTime = DateFormat.jm('ar').parse(reminder.time);
      final hour = parsedTime.hour;
      final minute = parsedTime.minute;
      log('Parsed time: $hour:$minute');

      for (int i = 0; i < 7; i++) {
        if (reminder.daysSelected[i]) {
          final notificationId = (reminder.id.hashCode + i).abs();
          final scheduledDate = _nextInstanceOfDay(i, hour, minute);
          log('Scheduling notification ID $notificationId for day $i at $scheduledDate');

          await LocalNotificationService.scheduleReminderNotification(
            id: notificationId,
            title: 'تذكير الدواء: ${reminder.drugName}',
            body: 'تناول ${reminder.dosage.isNotEmpty ? reminder.dosage : "الجرعة"} ${reminder.mealTiming.isNotEmpty ? reminder.mealTiming : ""}',
            scheduledDate: scheduledDate,
            payload: reminder.id,
          );
        } else {
          log('Day $i not selected, skipping');
        }
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تم جدولة التذكير بنجاح')),
      );
    } catch (e) {
      log('Error scheduling notification: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('فشل في جدولة التذكير: $e')),
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
    log('Calculated next instance for day $dayOfWeek: $scheduledDate');
    return scheduledDate;
  }

  Future<void> _cancelNotifications(String reminderId) async {
    log('Canceling notifications for reminder ID: $reminderId');
    try {
      for (int i = 0; i < 7; i++) {
        final notificationId = (reminderId.hashCode + i).abs();
        log('Canceling notification ID $notificationId');
        await LocalNotificationService.cancelNotification(notificationId);
      }
    } catch (e) {
      log('Error canceling notifications: $e');
    }
  }

  Future<void> _loadReminders() async {
    final prefs = await SharedPreferences.getInstance();
    final reminderJson = prefs.getString('reminders');
    log('Loading reminders: $reminderJson');
    if (reminderJson != null) {
      setState(() {
        reminders = DrugReminder.fromJsonList(reminderJson);
      });
      for (var reminder in reminders) {
        await _scheduleNotification(reminder);
      }
    }
  }

  Future<void> _saveReminders() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('reminders', DrugReminder.toJsonList(reminders));
    log('Saved reminders: ${DrugReminder.toJsonList(reminders)}');
  }

  void addReminder(DrugReminder reminder) {
    log('Adding reminder: ${reminder.toJson()}');
    setState(() {
      reminders.add(reminder);
    });
    _saveReminders();
    _scheduleNotification(reminder);
  }

  void updateReminder(DrugReminder updatedReminder) {
    log('Updating reminder: ${updatedReminder.toJson()}');
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
    log('Deleting reminder ID: $id');
    final reminder = reminders.firstWhere(
      (r) => r.id == id,
      orElse: () => DrugReminder(
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
        log('Deleted image: ${reminder.imagePath}');
      } catch (e) {
        log('Failed to delete image: $e');
      }
    }
    setState(() {
      reminders.removeWhere((r) => r.id == id);
    });
    _saveReminders();
    _cancelNotifications(id);
  }

  Future<void> clearAllReminders() async {
    log('Clearing all reminders');
    for (var reminder in reminders) {
      if (reminder.imagePath != null && File(reminder.imagePath!).existsSync()) {
        try {
          await File(reminder.imagePath!).delete();
          log('Deleted image: ${reminder.imagePath}');
        } catch (e) {
          log('Failed to delete image: $e');
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