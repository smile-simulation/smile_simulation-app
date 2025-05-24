import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/core/widgets/custom_button.dart';
import 'package:smile_simulation/features/reminders/presentation/views/add_new_drug_view.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/custom_container_for_reminders_features.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/custome_reminder_button.dart';
import 'package:smile_simulation/generated/l10n.dart';

class AddVisitsViewBody extends StatefulWidget {
  const AddVisitsViewBody({super.key});

  @override
  State<AddVisitsViewBody> createState() => _AddDrrugReminderViewBodyState();
}

class _AddDrrugReminderViewBodyState extends State<AddVisitsViewBody> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomBodyScreen(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.only(bottom: 24), // space for keyboard
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
                        S.of(context).visitSchedules,
                        style: AppTextStyles.headline2(context),
                      ),
                      CustomButton(
                        title: isSelected
                            ? S.of(context).edit
                            : S.of(context).cancel,
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
                                ).copyWith(color: AppColors.primaryColor),
                              ),
                              const SizedBox(height: 18),
                              Row(
                                children: [
                                  Text(
                                    '2025/12/19',
                                    style: AppTextStyles.subTitle2(context),
                                  ),
                                  const SizedBox(width: 120),
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
                  text: S.of(context).addNewReminder,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AddNewDrugView(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
