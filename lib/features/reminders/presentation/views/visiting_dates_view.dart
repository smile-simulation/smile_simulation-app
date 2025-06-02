import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smile_simulation/core/services/local_notification_service.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/features/reminders/data/models/visist_reminder.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/visiting_dates_view_body_if_first_time.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/visiting_dates_view_body_if_not_first_time.dart';
import 'package:smile_simulation/generated/l10n.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:uuid/uuid.dart';

class VisitingDatesView extends StatefulWidget {
  const VisitingDatesView({super.key});

  @override
  State<VisitingDatesView> createState() => _VisitingDatesViewState();
}

class _VisitingDatesViewState extends State<VisitingDatesView> {
  List<VisitReminder> reminders = [];

  @override
  void initState() {
    super.initState();
    _loadReminders();
    log('Navigated to VisitingDatesView, triggering test notification');
    LocalNotificationService.showTestNotification();
  }

  Future<void> _scheduleNotification(VisitReminder reminder) async {
    log('Attempting to schedule notification for visit: ${reminder.toJson()}');
    if (reminder.name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى إدخال اسم الزيارة')),
      );
      return;
    }
    if (reminder.date.isEmpty || reminder.time.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى تحديد التاريخ والوقت')),
      );
      return;
    }
    try {
      final parsedDateTime = DateFormat('yyyy-MM-dd HH:mm').parse('${reminder.date} ${reminder.time}');
      final notificationId = reminder.id.hashCode.abs();
      final scheduledDate = tz.TZDateTime.from(parsedDateTime, tz.local);
      if (scheduledDate.isAfter(tz.TZDateTime.now(tz.local))) {
        await LocalNotificationService.scheduleReminderNotification(
          id: notificationId,
          title: 'تذكير زيارة: ${reminder.name}',
          body: 'الزيارة بتاريخ ${reminder.date} الساعة ${reminder.time}',
          scheduledDate: scheduledDate,
          payload: reminder.id,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('تم جدولة التذكير بنجاح')),
        );
      }
    } catch (e) {
      log('Error scheduling notification: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('فشل في جدولة التذكير: $e')),
      );
    }
  }

  Future<void> _cancelNotifications(String reminderId) async {
    log('Canceling notifications for visit ID: $reminderId');
    try {
      await LocalNotificationService.cancelNotification(reminderId.hashCode.abs());
    } catch (e) {
      log('Error canceling notifications: $e');
    }
  }

  Future<void> _loadReminders() async {
    final prefs = await SharedPreferences.getInstance();
    final reminderJson = prefs.getString('visitReminders');
    log('Loading visit reminders: $reminderJson');
    if (reminderJson != null) {
      setState(() {
        reminders = VisitReminder.fromJsonList(reminderJson);
      });
      for (var reminder in reminders) {
        await _scheduleNotification(reminder);
      }
    }
  }

  Future<void> _saveReminders() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('visitReminders', VisitReminder.toJsonList(reminders));
    log('Saved visit reminders: ${VisitReminder.toJsonList(reminders)}');
  }

  void addReminder(VisitReminder reminder) {
    log('Adding visit reminder: ${reminder.toJson()}');
    setState(() {
      reminders.add(reminder);
    });
    _saveReminders();
    _scheduleNotification(reminder);
  }

  void updateReminder(VisitReminder updatedReminder) {
    log('Updating visit reminder: ${updatedReminder.toJson()}');
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
    log('Deleting visit reminder ID: $id');
    final reminder = reminders.firstWhere(
      (r) => r.id == id,
      orElse: () => VisitReminder(id: '', name: '', date: '', time: ''),
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
    log('Clearing all visit reminders');
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
    await prefs.remove('visitReminders');
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.greyLightColor,
        appBar: customAppbar(context, title: S.of(context).visitSchedules, isBack: true),
        body: reminders.isEmpty
            ? VisitingDatesViewBodyIfFirstTime(
                onAddReminder: addReminder,
              )
            : VisitingDatesViewBodyIfNotFirstTime(
                reminders: reminders,
                onUpdateReminder: updateReminder,
                onDeleteReminder: deleteReminder,
                onClearAllReminders: clearAllReminders, visits: [],
              ),
      ),
    );
  }
}