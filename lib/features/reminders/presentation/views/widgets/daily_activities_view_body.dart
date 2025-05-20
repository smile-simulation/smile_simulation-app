import 'package:flutter/material.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/add_daily_activities_view_body.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/add_new_daily_activities_body.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/add_new_visiting_date_body.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/custome_reminder_button.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/text_setion_in_reminder_feature.dart';

class DailyActivitiesViewBody extends StatelessWidget {
  const DailyActivitiesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: CustomBodyScreen(child: Column(children: [
           Column(
              children: [
                SizedBox(height: 90),
                Container(
                  width: 250,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/reminder_daily_activities.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                TextSetionInReminderFeature(
                  text1: 'أضف الأنشطة اليومية الخاصة بك ... وسوف نذكرك بمواعيدها',
                  text2: 'أضف  الأنشطة اليومية الخاصة بك الى تذكيراتك حتى نتمكن',
                  text3: 'من تذكيرك بها في أوقاتها المحدد',
                ),
                SizedBox(height: 50),
                CustomeReminderButton(
                  text: 'اضافة اول تذكير',
                  onPressed: () {
  Navigator.maybeOf(context)?.push(
    MaterialPageRoute(
      builder: (context) => const AddDailyActivitiesViewBody(),
    ),
  );
},

                ),
              ],
            ),
        ]))),
      ],
    );
  }
}
