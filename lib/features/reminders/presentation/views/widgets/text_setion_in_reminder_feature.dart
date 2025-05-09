import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

class TextSetionInReminderFeature extends StatelessWidget {
  const TextSetionInReminderFeature({
    super.key,
    required this.text1,
    required this.text2,
    this.text3,
  });
  final String text1;
  final String text2;
  final String? text3;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50),
        Align(
          alignment: Alignment.center,
          child: Text(
            text1,
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
          ),
        ),
        SizedBox(height: 30),

        Align(
          alignment: Alignment.center,
          child: Text(
            text2,
            style: TextStyle(color: AppColors.greyColor, fontSize: 14),
            maxLines: 1,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            text3!,
            style: TextStyle(color: AppColors.greyColor, fontSize: 14),
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
