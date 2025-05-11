import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/widgets/custom_loading_shimmer.dart';
import 'package:smile_simulation/features/advices/presentation/views/widgets_skeletons/category_image_skeleton.dart';

import 'one_line_text_skeleton.dart';

class CategoryItemCardSkeleton extends StatelessWidget {
  const CategoryItemCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        width: 180,
        height: 200,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              spreadRadius: 1,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8) ,
                child: CustomLoadingShimmer(SkeletonWidget: CategoryImageSkeleton())),

            const SizedBox(height: 16),
            CustomLoadingShimmer(SkeletonWidget: OneLineTextSkeleton()),
          ],
        ),
      ),
    );
  }
}
