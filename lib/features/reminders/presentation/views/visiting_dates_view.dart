import 'package:flutter/material.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/visiting_dates_view_body.dart';

class VisitingDatesView extends StatelessWidget {
  const VisitingDatesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
                appBar: customAppbar(context,title: 'مواعيد الزيارات',isBack:true),

        body: const VisitingDatesViewBody()));
  }
}
