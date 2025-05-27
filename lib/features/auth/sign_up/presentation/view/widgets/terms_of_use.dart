import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/features/more/presentation/views/widgets/privacy_policy_dialog.dart';
import 'package:smile_simulation/generated/l10n.dart';

class TermsOfUse extends StatelessWidget {
  const TermsOfUse({super.key, required this.onCkecked, required this.value});
  final Function() onCkecked;
  final bool value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          activeColor: AppColors.primaryColor,
          onChanged: (value) {
            onCkecked();
          },
        ),
        Flexible(
          child: RichText(
            softWrap: true,
            text: TextSpan(
              text: S.of(context).agreeToTermsPrefix,
              style: AppTextStyles.bodyText2(
                context,
              ).copyWith(color: AppColors.blackColor),
              children: [
                TextSpan(
                  text: S.of(context).privacyPolicy,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                  recognizer:
                      TapGestureRecognizer()
                        ..onTap = () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return CustomPoliciesAndConditionsDialog(
                                title: S.of(context).privacyPolicy,
                                path:
                                    "assets/policies_and_conditions/privacy_policy.md",
                              );
                            },
                          );
                        },
                ),
                TextSpan(text: S.of(context).and),
                TextSpan(
                  text: S.of(context).termsAndConditions,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                  recognizer:
                      TapGestureRecognizer()
                        ..onTap = () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return CustomPoliciesAndConditionsDialog(
                                title: S.of(context).termsAndConditions,
                                path:
                                    "assets/policies_and_conditions/terms_and_conditions.md",
                              );
                            },
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
