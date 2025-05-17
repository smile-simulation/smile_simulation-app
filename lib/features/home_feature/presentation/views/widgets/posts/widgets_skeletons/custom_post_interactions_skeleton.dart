import 'package:flutter/material.dart';
import 'package:smile_simulation/core/widgets/custom_loading_shimmer.dart';

import 'post_header_text_skeleton.dart';

class CustomPostInteractionsSkeleton extends StatelessWidget {
  const CustomPostInteractionsSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomLoadingShimmer(
          SkeletonWidget: SizedBox(width: 52, child: PostHeaderTextSkeleton()),
        ),
        SizedBox(width: 4),
        CustomLoadingShimmer(
          SkeletonWidget: SizedBox(width: 52, child: PostHeaderTextSkeleton()),
        ),
      ],
    );
  }
}
