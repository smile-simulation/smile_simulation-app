import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/widgets/custom_loading_shimmer.dart';
import 'package:smile_simulation/features/advices/presentation/views/widgets_skeletons/content_skeleton.dart';
import 'package:smile_simulation/features/advices/presentation/views/widgets_skeletons/one_line_text_skeleton.dart';

class TodaysAdviceSkeleton extends StatelessWidget {
  const TodaysAdviceSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.whiteColor,
      child: Container(
        width: double.infinity,
        height: 150,
        padding: EdgeInsets.only(top: 0, left: 8, right: 8, bottom: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          // color: AppColors.primaryColor.withAlpha(100),
        ),
        child: Column(
          children: [
            SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: CustomLoadingShimmer(
                    SkeletonWidget: OneLineTextSkeleton(),
                  ),
                ),
                Expanded(flex: 1, child: SizedBox()),
              ],
            ),
            SizedBox(height: 12),
            Expanded(
              child: CustomLoadingShimmer(SkeletonWidget: ContentSkeleton()),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: CustomLoadingShimmer(
                    SkeletonWidget: OneLineTextSkeleton(),
                  ),
                ),
                Expanded(flex: 1, child: SizedBox()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
