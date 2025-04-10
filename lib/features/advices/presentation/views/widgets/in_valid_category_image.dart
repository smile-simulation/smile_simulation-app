
import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/generated/l10n.dart';

class InValidCategoryImage extends StatelessWidget {
  const InValidCategoryImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
      ),
      child: Text(
        S.of(context).imageError,
        style: AppTextStyles.subTitle2(
          context,
        ).copyWith(color: AppColors.whiteColor),
        maxLines: 2,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
