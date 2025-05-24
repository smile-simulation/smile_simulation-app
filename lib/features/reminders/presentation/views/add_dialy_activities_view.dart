import 'package:flutter/material.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/add_daily_activities_view_body.dart';

class AddDailyActivitiesView extends StatelessWidget {
  const AddDailyActivitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, title: 'الانشطة اليومية', isBack: true),
      body: AddDailyActivitiesViewBody(),
    );
  }
}
