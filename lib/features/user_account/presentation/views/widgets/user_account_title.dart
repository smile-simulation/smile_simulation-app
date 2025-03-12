import 'package:flutter/material.dart';
import 'package:smile_simulation/core/services/localization_helper.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/utils/app_translation.dart';

class UserAccountTitle extends StatelessWidget {
  const UserAccountTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      LocalizationHelper.translate(TranslationKeys.personalInfo),
      style: AppTextStyles.style20W700(
        context,
      ).copyWith(color: AppColors.blackColor),
    );
  }
}
