import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/generated/l10n.dart';

class UserAccountTitle extends StatelessWidget {
  const UserAccountTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      S.of(context).personal_info,
      style: AppTextStyles.headline2(
        context,
      ).copyWith(color: AppColors.blackColor),
    );
  }
}
