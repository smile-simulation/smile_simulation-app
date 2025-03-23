import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isSecondary = false,
    this.isMinWidth = false,
  });

  final Function() onPressed;
  final String title;
  final bool isSecondary;
  final bool isMinWidth;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: isMinWidth ? 45 : 50,
      minWidth: isMinWidth ? 130 : double.infinity,
      color: isSecondary ? AppColors.whiteColor : AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: AppColors.primaryColor),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: AppTextStyles.button2(context).copyWith(
          color: isSecondary ? AppColors.primaryColor : AppColors.whiteColor,
        ),
      ),
    );
  }
}
