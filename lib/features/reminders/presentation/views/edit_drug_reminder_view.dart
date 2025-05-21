import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/core/widgets/custom_button.dart';
import 'package:smile_simulation/core/widgets/custom_text_field.dart';
import 'package:smile_simulation/features/reminders/presentation/views/visiting_dates_view.dart';

class EditDrugReminderView extends StatelessWidget {
  const EditDrugReminderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: customAppbar(context, title: 'منبه الدواء', isBack: true),
        body: EditDrugReminderViewBody(),
      ),
    );

  }
}

class EditDrugReminderViewBody extends StatelessWidget {
  const EditDrugReminderViewBody({super.key});

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
                  
                 
                    CustomTextField(
                      hintText: ' اسم الدواء',
                      keyboardType: TextInputType.text,
                      controller: TextEditingController(),
                      fillColor: Colors.white,
                    ),
                   
                    CustomTextField(
                      hintText: '3 مرات يوميا',
                      keyboardType: TextInputType.text,
                      controller: TextEditingController(),
                      suffixIcon: Icon(Icons.calendar_today_outlined),
                      fillColor: Colors.white,
                    ),
                    // Text(
                    //   'الكمية ',
                    //   style: AppTextStyles.subTitle2(context),
                    // ),
                    CustomTextField(
                      hintText: '1 قرص' ,
                      keyboardType: TextInputType.text,
                      controller: TextEditingController(),
                      suffixIcon: Icon(Icons.access_time),
                      fillColor: Colors.white,
                    ),
                    Text(
                      'وقت التنبيه ',
                      style: AppTextStyles.subTitle2(context),
                    ),
                    CustomTextField(
                      hintText: '8:30 صباحًا ' ,
                      keyboardType: TextInputType.text,
                      controller: TextEditingController(),
                      suffixIcon: Icon(Icons.access_time),
                      fillColor: Colors.white,
                    ),
                    Text(
                      'وقت تناول الدواء: ',
                      style: AppTextStyles.subTitle2(context),
                    ),
                    CustomTextField(
                      hintText: 'قبل تناول الطعام' ,
                      keyboardType: TextInputType.text,
                      controller: TextEditingController(),
                      suffixIcon: Icon(Icons.access_time),
                      fillColor: Colors.white,
                    ),
                    Text(
                      'تاريخ التوقف عن الدواء ',
                      style: AppTextStyles.subTitle2(context),
                    ),
                    CustomTextField(
                      hintText: 'دواء مدى الحياة' ,
                      keyboardType: TextInputType.text,
                      controller: TextEditingController(),
                      suffixIcon: Icon(Icons.access_time),
                      fillColor: Colors.white,
                    ),
                   CustomButton(title: 'تعديل البيانات', onPressed: (){}),
                   CustomButton(title: ' حذف الدواء', onPressed: (){}),                    SizedBox(height: screenHeight * 0.22),
                    
                   
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
