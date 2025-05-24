import 'package:flutter/material.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/drug_reminder_view_body_if_first_time.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/other_tasking_view_body.dart';

class OtherTasksView extends StatelessWidget {
  const OtherTasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: customAppbar(context, title: ' مهام اخرى', isBack: true),
        body: const OtherTaskingViewBody(),
      ),
    );
  }
}
