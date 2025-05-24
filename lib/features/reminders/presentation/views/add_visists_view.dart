import 'package:flutter/material.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/add_visits_view_body.dart';
import 'package:smile_simulation/generated/l10n.dart';

class AddVisistsView extends StatelessWidget {
  const AddVisistsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        context,
        title: S.of(context).visitSchedules,
        isBack: true,
      ),
      body: AddVisitsViewBody(),
    );
  }
}
