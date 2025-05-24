import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/core/widgets/custom_button.dart';
import 'package:smile_simulation/features/reminders/presentation/views/add_new_drug_view.dart';
import 'package:smile_simulation/features/reminders/presentation/views/edit_drug_reminder_view.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/custom_container_for_reminders_features.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/custome_reminder_button.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/camera_picker_image.dart';
import 'package:smile_simulation/generated/l10n.dart';

class DrugReminderViewBodyIfNotFirstTime extends StatefulWidget {
  const DrugReminderViewBodyIfNotFirstTime({super.key});

  @override
  State<DrugReminderViewBodyIfNotFirstTime> createState() =>
      _DrugReminderViewBodyState();
}

class _DrugReminderViewBodyState
    extends State<DrugReminderViewBodyIfNotFirstTime> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    bool isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return CustomBodyScreen(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).medicineReminders,
                  style: AppTextStyles.headline2(context),
                ),
                CustomButton(
                  title:
                      !isSelected ? S.of(context).edit : S.of(context).cancel,
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
            const SizedBox(height: 24),

            /// Reminder Card with Delete Option
            Stack(
              children: [
                if (isSelected)
                  Positioned.fill(
                    child: PositionedDirectional(
                      start: 0,
                      top: 0,
                      bottom: 0,
                      
                      child: CustomContainerForReminderFeature(
                        color: AppColors.primaryColor,
                        widget: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/delete.png",
                                color: Colors.white,
                                width: 28,
                                height: 28,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditDrugReminderView(),
                      ),
                    );
                  },
                  child: Container(
                    margin:
                        isArabic
                            ? EdgeInsets.only(right: isSelected ? 70 : 0)
                            : EdgeInsets.only(left: isSelected ? 70 : 0),
                    child: CustomContainerForReminderFeature(
                      widget: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: CameraPickerWidget(width: 85, height: 85),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 12.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    S.of(context).medicineName,
                                    style: AppTextStyles.subTitle1(
                                      context,
                                    ).copyWith(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'مرة واحدة يوميًا (الكمية 1)',
                                    style: AppTextStyles.subTitle2(context),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '7:00 صباحًا',
                                            style: AppTextStyles.subTitle2(
                                              context,
                                            ),
                                          ),
                                          Text(
                                            'قبل تناول الطعام',
                                            style: AppTextStyles.subTitle2(
                                              context,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            /// Add New Reminder Button
            CustomeReminderButton(
              text: S.of(context).addReminder,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AddNewDrugView()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
