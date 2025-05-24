import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/core/widgets/custom_button.dart';
import 'package:smile_simulation/core/widgets/custom_text_field.dart';
import 'package:smile_simulation/features/reminders/presentation/views/add_visists_view.dart';

class AddNewDailActivitiesBody extends StatelessWidget {
  const AddNewDailActivitiesBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: customAppbar(context, title: ' الأنشطة اليومية', isBack: true),
      body: CustomBodyScreen(
        child: SingleChildScrollView(
          // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'أضف مواعيد الأنشطة اليومية الخاصة بك حتى نتمكن من تذكيرك بها في أوقاتها المحددة.',
                style: AppTextStyles.style16W400(context),
              ),
              SizedBox(height: screenHeight * 0.06),
              Text('اسم النشاط', style: AppTextStyles.subTitle2(context)),
              SizedBox(height: screenHeight * 0.007),
              CustomTextField(
                hintText: ' اسم النشاط',
                keyboardType: TextInputType.text,
                controller: TextEditingController(),
                fillColor: Colors.white,
              ),
              SizedBox(height: screenHeight * 0.07),
              Text('الوقت ', style: AppTextStyles.subTitle2(context)),
              SizedBox(height: screenHeight * 0.007),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      hintText: 'الوقت ',
                      keyboardType: TextInputType.text,
                      controller: TextEditingController(),
                      suffixIcon: const Icon(Icons.access_time),
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(width: screenHeight * 0.03),
                  Image.asset(
                    'assets/images/delete.png',
                    height: 36,
                    width: 36,
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              Row(
                children: [
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: AppColors.primaryColor,
                    child: const Icon(Icons.add, color: Colors.white, size: 16),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'إضافة وقت آخر',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.27),
              CustomButton(
                title: 'اضافة النشاط',
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
