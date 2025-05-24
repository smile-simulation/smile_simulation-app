import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/core/widgets/custom_button.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/custom_container_for_reminders_features.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/custome_reminder_button.dart';
import 'package:smile_simulation/generated/l10n.dart';

class AddVisitsViewBody extends StatefulWidget {
  const AddVisitsViewBody({super.key});

  @override
  State<AddVisitsViewBody> createState() => _AddVisitsViewBodyState();
}

class _AddVisitsViewBodyState extends State<AddVisitsViewBody> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    bool isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return CustomBodyScreen(
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).visitSchedules,
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

            /// Visit Card with Delete Option
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
                Container(
                  margin: isArabic
                      ? EdgeInsets.only(right: isSelected ? 70 : 0)
                      : EdgeInsets.only(left: isSelected ? 70 : 0),
                  child: CustomContainerForReminderFeature(
                    widget: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 32,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).visitName,
                            style: AppTextStyles.subTitle1(
                              context,
                            ).copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 18),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '2025/12/19',
                                style: AppTextStyles.subTitle2(context),
                              ),
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

            const SizedBox(height: 40),

            /// Add New Visit Button
            CustomeReminderButton(
              text: S.of(context).addNewReminder,
              onPressed: () {
                // TODO: Navigate to Add New Visit screen
              },
            ),
          ],
        ),
      ),
    );
  }
}
