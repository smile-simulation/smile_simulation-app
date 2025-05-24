import 'package:flutter/material.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/daily_activities_view_body.dart';

class DailyActivitiesView extends StatelessWidget {
  const DailyActivitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, title: 'الأنشطة اليومية', isBack: true),
      // appBar: AppBar(
      //   title: const Text('الأنشطة اليومية'),
      //   centerTitle: true,
      //   backgroundColor: Colors.blue,
      // ),
      body: const DailyActivitiesViewBody(),
    );
  }
}
