import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

class OneLineTextSkeleton extends StatelessWidget {
  const OneLineTextSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.greyLightColor,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
