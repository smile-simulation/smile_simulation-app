import 'package:flutter/material.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/add_new_drug_screen_body.dart';

class AddNewDrugScreen extends StatelessWidget {
  const AddNewDrugScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,

      child: Scaffold(
        appBar: customAppbar(context, title: 'اضافة دواء جديد', isBack: true),
        body: AddNewDrugScreenBody(),
      ),
    );
  }
}
