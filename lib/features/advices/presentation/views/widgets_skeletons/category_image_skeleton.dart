import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

class CategoryImageSkeleton extends StatelessWidget {
  const CategoryImageSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      color: AppColors.greyLightColor,
    );
  }
}
