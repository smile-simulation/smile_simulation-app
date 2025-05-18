import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/widgets/custom_loading_shimmer.dart';

import 'custom_comment_body_skeleton.dart';

class CustomCommentSkeleton extends StatelessWidget {
  const CustomCommentSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.whiteColor,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            CustomLoadingShimmer(
              SkeletonWidget: SizedBox(
                width: 64,
                height: 64,
                child: CircleAvatar(
                  backgroundColor: AppColors.grayHeavyText_1Color,
                  radius: 20,
                ),
              ),
            ),
            SizedBox(width: 8),
            Expanded(child: CustomCommentBodySkeleton()),
          ],
        ),
      ),
    );
  }
}
