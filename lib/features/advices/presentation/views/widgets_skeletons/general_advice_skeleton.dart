import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/widgets/custom_loading_shimmer.dart';

import 'button_skeleton.dart';
import 'content_skeleton.dart';
import 'one_line_text_skeleton.dart';

class GeneralAdviceSkeleton extends StatelessWidget {
  const GeneralAdviceSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.whiteColor,
      child: Container(
        width: double.infinity,
        height: 132,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomLoadingShimmer(
                    SkeletonWidget: OneLineTextSkeleton(),
                  ),
                ),
                SizedBox(width: 32),
                CustomLoadingShimmer(SkeletonWidget: ButtonSkeleton()),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: CustomLoadingShimmer(SkeletonWidget: ContentSkeleton()),
            ),
          ],
        ),
      ),
    );
  }
}
