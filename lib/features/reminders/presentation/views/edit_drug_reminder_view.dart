import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/core/widgets/custom_button.dart';
import 'package:smile_simulation/core/widgets/custom_text_field.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/custom_container_for_reminders_features.dart';

class EditDrugReminderView extends StatelessWidget {
  const EditDrugReminderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: customAppbar(context, title: 'منبه الدواء', isBack: true),
        body: const EditDrugReminderViewBody(),
      ),
    );
  }
}

class EditDrugReminderViewBody extends StatelessWidget {
  const EditDrugReminderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Expanded(
          child: CustomBodyScreen(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              // child: SingleChildScrollView(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomContainerForReminderFeature(
                      widget: Image.asset(
                        'assets/images/edit_drug_reminder.png',
                        height: screenHeight * 0.2,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 18),
                    Text(
                      ' اسم الدواء',
                      style: AppTextStyles.subTitle2(context),
                    ),
                    SizedBox(height: 8),

                    CustomTextField(
                      hintText: 'اسم الدواء',
                      keyboardType: TextInputType.text,
                      controller: TextEditingController(),
                      fillColor: Colors.white,
                    ),
                    SizedBox(height: 18),
                    Text(' التكرار', style: AppTextStyles.subTitle2(context)),

                    SizedBox(height: 8),

                    CustomTextField(
                      hintText: '3 مرات يوميا',
                      keyboardType: TextInputType.text,
                      controller: TextEditingController(),
                      // suffixIcon: const Icon(Icons.calendar_today_outlined),
                      fillColor: Colors.white,
                    ),

                    SizedBox(height: 18),

                    Text(' الكمية', style: AppTextStyles.subTitle2(context)),
                    SizedBox(height: 8),

                    CustomTextField(
                      hintText: '1 قرص',
                      keyboardType: TextInputType.text,
                      controller: TextEditingController(),
                      // suffixIcon: const Icon(Icons.access_time),
                      fillColor: Colors.white,
                    ),
                    SizedBox(height: 18),
                    Text(
                      'وقت التنبيه',
                      style: AppTextStyles.subTitle2(context),
                    ),
                    SizedBox(height: 8),

                    CustomTextField(
                      hintText: '8:30 صباحًا',
                      keyboardType: TextInputType.text,
                      controller: TextEditingController(),
                      // suffixIcon: const Icon(Icons.access_time),
                      fillColor: Colors.white,
                    ),
                    SizedBox(height: 18),
                    Text(
                      'وقت تناول الدواء:',
                      style: AppTextStyles.subTitle2(context),
                    ),
                    SizedBox(height: 8),

                    CustomTextField(
                      hintText: 'قبل تناول الطعام',
                      keyboardType: TextInputType.text,
                      controller: TextEditingController(),
                      // suffixIcon: const Icon(Icons.access_time),
                      fillColor: Colors.white,
                    ),
                    SizedBox(height: 18),
                    Text(
                      'تاريخ التوقف عن الدواء',
                      style: AppTextStyles.subTitle2(context),
                    ),
                    SizedBox(height: 8),

                    CustomTextField(
                      hintText: 'دواء مدى الحياة',
                      keyboardType: TextInputType.text,
                      controller: TextEditingController(),
                      // suffixIcon: const Icon(Icons.access_time),
                      fillColor: Colors.white,
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        CustomButton(
                          title: 'تعديل البيانات',
                          isMinWidth: true,
                          onPressed: () {},
                        ),
                        const SizedBox(width: 40),
                        CustomButton(
                          title: 'حذف الدواء',
                          isMinWidth: true,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
