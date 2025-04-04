import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';

class MoreViewBody extends StatelessWidget {
  const MoreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: AppColors.whiteColor),
        onPressed: () {},
        child: Text(
          "Losgout",
          style: AppTextStyles.button2(
            context,
          ).copyWith(color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
