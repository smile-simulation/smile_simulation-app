import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

class PostHeaderTextSkeleton extends StatelessWidget {
  const PostHeaderTextSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.greyLightColor,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
