import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/widgets/custom_loading_shimmer.dart';

import '../custom_post_body_content_skeleton.dart';

class CustomPostBodySkeleton extends StatelessWidget {
  const CustomPostBodySkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 7, child: CustomPostBodyContentSkeleton()),
        SizedBox(width: 8),
        Expanded(
          flex: 4,

          child: CustomLoadingShimmer(
            SkeletonWidget: Container(color: AppColors.grayHeavyText_1Color),
          ),
        ),
      ],
    );
  }
}
