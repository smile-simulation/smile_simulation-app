import 'package:flutter/material.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/durg_reminder_view_body_if_not_first_time.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/drug_reminder_view_body_if_first_time.dart';
import 'package:smile_simulation/generated/l10n.dart';

class DrugReminderView extends StatefulWidget {
  const DrugReminderView({super.key});

  @override
  State<DrugReminderView> createState() => _DrugReminderViewState();
}

class _DrugReminderViewState extends State<DrugReminderView> {
  List<String> reminders = []; // مؤقتاً بنستخدم قائمة بسيطة

  void addReminder(String newReminder) {
    setState(() {
      reminders.add(newReminder);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        context,
        title: S.of(context).medicineReminder,
        isBack: true,
      ),
      body:
          reminders.isEmpty
              ? DrugReminderViewBodyIfNotFirstTime()
              : DrugReminderViewBodyIfFirstTime(onAddReminder: addReminder),
    );
  }
}
