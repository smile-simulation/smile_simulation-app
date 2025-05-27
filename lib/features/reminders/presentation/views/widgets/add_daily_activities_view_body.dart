import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/core/widgets/custom_button.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/custom_container_for_reminders_features.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/custome_reminder_button.dart';
import 'package:smile_simulation/generated/l10n.dart';

class AddDailyActivitiesViewBody extends StatefulWidget {
  const AddDailyActivitiesViewBody({super.key});

  @override
  State<AddDailyActivitiesViewBody> createState() =>
      _AddDailyActivitiesViewBodyState();
}

class _AddDailyActivitiesViewBodyState
    extends State<AddDailyActivitiesViewBody> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    bool isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return Scaffold(
      appBar: customAppbar(
        context,
        title: S.of(context).dailyActivities,
        isBack: true,
      ),
      body: CustomBodyScreen(
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
                    S.of(context).dailyActivities,
                    style: AppTextStyles.headline2(context),
                  ),
                  CustomButton(
                    title:
                        isSelected ? S.of(context).cancel : S.of(context).edit,
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

              /// Activity Card with Delete Option
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
                    margin:
                        isArabic
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
                              'اسم النشاط',
                              style: AppTextStyles.subTitle1(context).copyWith(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 18),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'مرة واحدة يوميًا',
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

              /// Add New Reminder Button
              CustomeReminderButton(
                text: S.of(context).addNewReminder,
                onPressed: () {
                  // Add your navigation logic here
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
