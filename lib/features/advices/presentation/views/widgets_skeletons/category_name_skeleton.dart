import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

class CategoryNameSkeleton extends StatelessWidget {
  const CategoryNameSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 14,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.greyLightColor,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
