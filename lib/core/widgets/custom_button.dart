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
    this.isExtraMinWidth = false,
    this.isLoading = false,
    this.isGreyBackground = false,
  });

  final Function() onPressed;
  final String title;
  final bool isSecondary;
  final bool isMinWidth;
  final bool isExtraMinWidth;
  final bool isLoading;
  final bool isGreyBackground;

  @override
  Widget build(BuildContext context) {
    double height;
    double minWidth;

    if (isExtraMinWidth) {
      height = 34;
      minWidth = 80;
    } else if (isMinWidth) {
      height = 45;
      minWidth = 130;
    } else {
      height = 50;
      minWidth = double.infinity;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: MaterialButton(
        height: height,
        minWidth: minWidth,
        color: isGreyBackground
            ? Colors.grey
            : (isSecondary ? AppColors.whiteColor : AppColors.primaryColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: isGreyBackground ? Colors.grey : AppColors.primaryColor,
          ),
        ),
        onPressed: onPressed,
        child: isLoading
            ? const CircularProgressIndicator(color: AppColors.whiteColor)
            : Text(
                title,
                style: AppTextStyles.button2(context).copyWith(
                  color: isGreyBackground
                      ? Colors.white
                      : (isSecondary
                          ? AppColors.primaryColor
                          : AppColors.whiteColor),
                ),
              ),
      ),
    );
  }
}
