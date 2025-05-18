import 'package:flutter/material.dart';
import 'package:smile_simulation/core/widgets/custom_loading_shimmer.dart';
import 'package:smile_simulation/features/advices/presentation/views/widgets_skeletons/one_line_text_skeleton.dart';

class CustomCommentBodySkeleton extends StatelessWidget {
  const CustomCommentBodySkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomLoadingShimmer(
                SkeletonWidget: OneLineTextSkeleton(),
              ),
              flex: 4,
            ),
            Spacer(flex: 6),
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: CustomLoadingShimmer(
                SkeletonWidget: OneLineTextSkeleton(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
