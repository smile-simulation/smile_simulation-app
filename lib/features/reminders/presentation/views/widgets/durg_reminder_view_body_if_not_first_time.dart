import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/core/widgets/custom_button.dart';
import 'package:smile_simulation/features/reminders/presentation/views/edit_drug_reminder_view.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/custom_container_for_reminders_features.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/custome_reminder_button.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/camera_picker_image.dart';

// ✅ Make sure you have this file and screen:


class DrugReminderViewBodyIfNotFirstTime extends StatefulWidget {
  const DrugReminderViewBodyIfNotFirstTime({super.key});

  @override
  State<DrugReminderViewBodyIfNotFirstTime> createState() =>
      _AddDrrugReminderViewBodyState();
}

class _AddDrrugReminderViewBodyState
    extends State<DrugReminderViewBodyIfNotFirstTime> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                    'منبهات الأدوية',
                    style: AppTextStyles.headline2(context),
                  ),
                  CustomButton(
                    title: isSelected == false ? "الغاء" : 'تعديل',
                    isGreyBackground: isSelected == false,
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
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EditDrugReminderView(),
                        ),
                      );
                    },
                    child: CustomContainerForReminderFeature(
                      widget: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: CameraPickerWidget(width: 85, height: 85),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'اسم الدواء',
                                  style: AppTextStyles.subTitle1(context)
                                      .copyWith(color: AppColors.primaryColor),
                                ),
                                const SizedBox(height: 18),
                                Text(
                                  'مرة واحدة يوميًا (الكمية 1)',
                                  style: AppTextStyles.subTitle2(context),
                                ),
                                const SizedBox(height: 14),
                                Row(
                                  children: [
                                    Text(
                                      ' قبل تناول الطعام',
                                      style: AppTextStyles.subTitle2(context),
                                    ),
                                    const SizedBox(width: 15),
                                    Text(
                                      '  7:00 صباحًا',
                                      style: AppTextStyles.subTitle2(context),
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
              text: ' إضافة تذكير جديد',
              onPressed: () {
                // Example: you can send reminder info back
                Navigator.of(context).pop('Paracetamol Reminder');
              },
            ),
          ],
        ),
      ),
    );
  }
}
