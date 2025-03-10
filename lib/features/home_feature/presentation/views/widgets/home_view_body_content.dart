import 'package:flutter/material.dart';
import 'package:smile_simulation/core/services/localization_helper.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/utils/app_translation.dart';

class HomeViewBodyContent extends StatelessWidget {
  const HomeViewBodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(45),
          topRight: Radius.circular(45),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text(
            LocalizationHelper.translate(TranslationKeys.posts),
            style: AppTextStyles.style20W700(
              context,
            ).copyWith(color: AppColors.blackColor),
          ),
          SizedBox(height: 16,),
          CustomPost()

        ],
      ),
    );
  }
}

class CustomPost extends StatelessWidget {
  const CustomPost({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
