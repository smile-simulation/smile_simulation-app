import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';

class PostSectionsTitle extends StatelessWidget {
  const PostSectionsTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyles.headline2(
        context,
      ).copyWith(color: AppColors.blackColor),
    );
  }
}
