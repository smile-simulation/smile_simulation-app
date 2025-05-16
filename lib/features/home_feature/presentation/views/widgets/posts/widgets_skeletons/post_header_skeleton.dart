import 'package:flutter/material.dart';
import 'package:smile_simulation/core/widgets/custom_loading_shimmer.dart';

import 'post_header_text_skeleton.dart';
import 'user_image_skeleton.dart';

class PostHeaderSkeleton extends StatelessWidget {
  const PostHeaderSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CustomLoadingShimmer(SkeletonWidget: UserImageSkeleton()),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            CustomLoadingShimmer(
              SkeletonWidget: SizedBox(
                width: 160,
                child: PostHeaderTextSkeleton(),
              ),
            ),
            SizedBox(height: 4),
            CustomLoadingShimmer(
              SkeletonWidget: SizedBox(
                width: 100,
                child: PostHeaderTextSkeleton(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
