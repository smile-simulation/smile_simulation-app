import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final Function() onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 54,
      minWidth: double.infinity,
      color: AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: AppTextStyles.button2(context).copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}

class TextStyles {}
