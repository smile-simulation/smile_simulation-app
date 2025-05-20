import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/core/widgets/custom_button.dart';
import 'package:smile_simulation/features/reminders/presentation/views/add_new_drug_screen.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/custom_container_for_reminders_features.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/custome_reminder_button.dart';

class AddDailyActivitiesViewBody extends StatefulWidget {
  const AddDailyActivitiesViewBody({super.key});

  @override
  State<AddDailyActivitiesViewBody> createState() => _AddDrrugReminderViewBodyState();
}

class _AddDrrugReminderViewBodyState extends State<AddDailyActivitiesViewBody> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, title: 'الأنشطة اليومية', isBack: true),
      body: Column(
        children: [
          Expanded(
            child: CustomBodyScreen(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'الأنشطة اليومية',
                          style: AppTextStyles.headline2(context),
                        ),
                        CustomButton(
                          title: isSelected ? 'تعديل' : 'إلغاء',
                          isGreyBackground: !isSelected,
                          isExtraMinWidth: true,
                          onPressed: () {
                            setState(() {
                              isSelected = !isSelected;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomContainerForReminderFeature(
                        color: AppColors.primaryColor,
                        widget: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Image.asset(
                                "assets/images/delete.png",
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: isSelected ? 0 : 70),
                        child: CustomContainerForReminderFeature(
                          widget: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal:32,
                              vertical: 32,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'اسم النشاط',
                                  style: AppTextStyles.subTitle1(context).copyWith(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                const SizedBox(height: 18),
                                Row(
                                  children: [
                                    Text(
                                      'مرة واحدة يوميًا ',
                                      style: AppTextStyles.subTitle2(context),
                                    ),
                                    const SizedBox(width: 30),
                                    Text(
                                      '8:15 صباحًا',
                                      style: AppTextStyles.subTitle2(context),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  CustomeReminderButton(
                    text: 'إضافة تذكير جديد',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AddNewDrugScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
