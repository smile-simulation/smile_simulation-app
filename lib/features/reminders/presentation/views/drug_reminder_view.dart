import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/features/reminders/data/models/reminder.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/durg_reminder_view_body_if_not_first_time.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/drug_reminder_view_body_if_first_time.dart';

class DrugReminderView extends StatefulWidget {
  const DrugReminderView({super.key});

  @override
  State<DrugReminderView> createState() => _DrugReminderViewState();
}

class _DrugReminderViewState extends State<DrugReminderView> {
  List<Reminder> reminders = [];
  final String _remindersKey = 'reminders';

  @override
  void initState() {
    super.initState();
    _loadReminders();
  }

  Future<void> _loadReminders() async {
    final prefs = await SharedPreferences.getInstance();
    final remindersJson = prefs.getString(_remindersKey);
    if (remindersJson != null) {
      setState(() {
        reminders = Reminder.fromJsonList(remindersJson);
      });
    }
  }

  Future<void> _saveReminders() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_remindersKey, Reminder.toJsonList(reminders));
  }

  void addReminder(Reminder newReminder) {
    setState(() {
      reminders.add(newReminder);
    });
    _saveReminders();
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
  }

  void deleteReminder(String id) {
    setState(() {
      reminders.removeWhere((r) => r.id == id);
    });
    _saveReminders();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: customAppbar(context, title: 'منبه الدواء', isBack: true),
        body: reminders.isEmpty
            ? DrugReminderViewBodyIfFirstTime(onAddReminder: addReminder)
            : DrugReminderViewBodyIfNotFirstTime(
                reminders: reminders,
                onUpdateReminder: updateReminder,
                onDeleteReminder: deleteReminder,
              ),
      ),
    );
  }
}