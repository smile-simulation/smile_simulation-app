import 'package:flutter/material.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/visiting_dates_view_body.dart';
import 'package:smile_simulation/generated/l10n.dart';

class VisitingDatesView extends StatelessWidget {
  const VisitingDatesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        context,
        title: S.of(context).visitSchedules,
        isBack: true,
      ),

      body: const VisitingDatesViewBody(),
    );
  }
}
