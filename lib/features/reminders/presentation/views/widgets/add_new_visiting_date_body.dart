import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/core/widgets/custom_button.dart';
import 'package:smile_simulation/core/widgets/custom_text_field.dart';
import 'package:smile_simulation/features/reminders/presentation/views/add_visists_view.dart';
import 'package:smile_simulation/generated/l10n.dart';
class AddNewVisitingDateBody extends StatelessWidget {
  const AddNewVisitingDateBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: customAppbar(
        context,
        title: S.of(context).visitSchedules,
        isBack: true,
      ),
      body: CustomBodyScreen(
        child: SingleChildScrollView(
          // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).addVisitSchedulesInstruction,
                style: AppTextStyles.style16W400(context),
              ),
              SizedBox(height: screenHeight * 0.06),
              Text(
                S.of(context).visitName,
                style: AppTextStyles.subTitle2(context),
              ),
              SizedBox(height: screenHeight * 0.007),
              CustomTextField(
                hintText: S.of(context).visitName,
                keyboardType: TextInputType.text,
                controller: TextEditingController(),
                fillColor: Colors.white,
              ),
              SizedBox(height: screenHeight * 0.03),
              Text(
                S.of(context).date,
                style: AppTextStyles.subTitle2(context),
              ),
              SizedBox(height: screenHeight * 0.007),
              CustomTextField(
                hintText: S.of(context).date,
                keyboardType: TextInputType.text,
                controller: TextEditingController(),
                suffixIcon: const Icon(Icons.calendar_today_outlined),
                fillColor: Colors.white,
              ),
              SizedBox(height: screenHeight * 0.03),
              Text(
                S.of(context).time,
                style: AppTextStyles.subTitle2(context),
              ),
              SizedBox(height: screenHeight * 0.007),
              CustomTextField(
                hintText: S.of(context).time,
                keyboardType: TextInputType.text,
                controller: TextEditingController(),
                suffixIcon: const Icon(Icons.access_time),
                fillColor: Colors.white,
              ),
              SizedBox(height: screenHeight * 0.1), // أقل من 0.22 عشان تبعد عن الأسفل
              CustomButton(
                title: S.of(context).addNewReminder,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AddVisistsView(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
