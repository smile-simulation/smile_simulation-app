import 'package:flutter/material.dart';
import 'package:smile_simulation/core/services/localization_helper.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/utils/app_translation.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/widgets/currentUserCircleIcon.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/widgets/custom_icon.dart';

class ClickableSearchBar extends StatelessWidget {
  const ClickableSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: ,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Row(
        children: [
          Currentusercircleicon(color: AppColors.primaryColor, borderWidth: 6),
          SizedBox(width: 4),
          Expanded(
            child: Container(
              height: 36,
              padding: EdgeInsets.symmetric(horizontal: 8),
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                color: AppColors.veryLightGreyColor,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                LocalizationHelper.translate(TranslationKeys.createNewPost),
                style: AppTextStyles.style14W400(
                  context,
                ).copyWith(color: AppColors.greyColor),
              ),
            ),
          ),
          SizedBox(width: 10),
          CustomIcon(
            icon: Icons.image,
            color: AppColors.primaryColor,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
