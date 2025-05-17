import 'package:flutter/material.dart';
import 'package:smile_simulation/core/widgets/custom_app_bar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/features/reminders/presentation/views/add_new_drug_screen.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/camera_section.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/custome_reminder_button.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/text_setion_in_reminder_feature.dart';

class DrugReminderViewBody extends StatelessWidget {
  const DrugReminderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        
        Expanded(
          child: CustomBodyScreen(
            child: Column(
              children: [
                SizedBox(height: 90),
                Container(
                  width: 250,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/reminder_drug_stimulant.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                TextSetionInReminderFeature(
                  text1: 'أضف الأدوية التي تتناولها ... وسوف نذكرك بمواعيدها',
                  text2:
                      'أضف الأدوية التي تستخدمها إلى تنبيهاتك الطبية حتى نتمكن',
                  text3: 'من تذكيرك بها في أوقاتها المحدد',
                ),
                SizedBox(height: 50),
                CustomeReminderButton(
                  text: 'اضافة اول تذكير',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AddNewDrugScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
