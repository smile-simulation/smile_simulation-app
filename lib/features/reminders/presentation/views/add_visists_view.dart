import 'package:flutter/material.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/add_visits_view_body.dart';

class AddVisistsView extends StatelessWidget {
  const AddVisistsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, title: ' مواعيد الزيارات ', isBack: true),
      body: AddVisitsViewBody(),
    );
  }
}
