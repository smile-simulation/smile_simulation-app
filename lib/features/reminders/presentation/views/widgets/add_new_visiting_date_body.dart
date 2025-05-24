import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/core/widgets/custom_button.dart';
import 'package:smile_simulation/core/widgets/custom_text_field.dart';
import 'package:smile_simulation/features/reminders/presentation/views/add_visists_view.dart';

class AddNewVisitingDateBody extends StatelessWidget {
  const AddNewVisitingDateBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: customAppbar(
        context,
        title: 'مواعيد الزيارات',
        isBack: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: CustomBodyScreen(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'أضف مواعيد زياراتك الطبية حتى نتمكن من تذكيرك بها في أوقاتها المحددة.',
                      style: AppTextStyles.style16W400(context),
                    ),
                    SizedBox(height: screenHeight * 0.06), // ~50
                    Text(
                      'اسم الزيارة',
                      style: AppTextStyles.subTitle2(context),
                    ),
                    SizedBox(height: screenHeight * 0.007), // ~12
                    CustomTextField(
                      hintText: 'عنوان الزيارة',
                      keyboardType: TextInputType.text,
                      controller: TextEditingController(),
                      fillColor: Colors.white,
                    ),
                    SizedBox(height: screenHeight * 0.03), // ~20
                    Text(
                      'التاريخ ',
                      style: AppTextStyles.subTitle2(context),
                    ),
                    SizedBox(height: screenHeight * 0.007), //
                    CustomTextField(
                      hintText: 'التاريخ ',
                      keyboardType: TextInputType.text,
                      controller: TextEditingController(),
                      suffixIcon: Icon(Icons.calendar_today_outlined),
                      fillColor: Colors.white,
                    ),
                    SizedBox(height: screenHeight * 0.03), // ~20
                    Text(
                      'الوقت ',
                      style: AppTextStyles.subTitle2(context),
                    ),
                   SizedBox(height: screenHeight * 0.007), //
                    CustomTextField(
                      hintText: 'الوقت ',
                      keyboardType: TextInputType.text,
                      controller: TextEditingController(),
                      suffixIcon: Icon(Icons.access_time),
                      fillColor: Colors.white,
                    ),
                    SizedBox(height: screenHeight * 0.22),
                    CustomButton(
                      title: 'اضافة الزيارة',
                      onPressed: () {
                        // Add your logic here
                        Navigator.of(context).push(MaterialPageRoute(builder:  (context) => const AddVisistsView(),
                        ));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
