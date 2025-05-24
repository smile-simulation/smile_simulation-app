import 'package:flutter/material.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/daily_activities_view_body.dart';

class DailyActivitiesView extends StatelessWidget {
  const DailyActivitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, title: ' الانشطة اليومية', isBack: true),
      body: const DailyActivitiesViewBody(),
    );
  }
}
