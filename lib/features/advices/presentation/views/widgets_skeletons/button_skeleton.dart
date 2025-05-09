import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

class ButtonSkeleton extends StatelessWidget {
  const ButtonSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: AppColors.lightGreyColor,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
