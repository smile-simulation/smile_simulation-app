import 'package:flutter/material.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/drug_reminder_view_body.dart';

class DrugReminderView extends StatelessWidget {
  const DrugReminderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: customAppbar(context, title: 'تذكير الأدوية', isBack: true),
        body: const DrugReminderViewBody(),
      ),
    );
  }
}
