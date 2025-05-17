import 'package:flutter/material.dart';
import 'package:smile_simulation/core/widgets/custom_loading_shimmer.dart';
import 'package:smile_simulation/features/advices/presentation/views/widgets_skeletons/one_line_text_skeleton.dart';

class CustomPostBodyContentSkeleton extends StatelessWidget {
  const CustomPostBodyContentSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomLoadingShimmer(SkeletonWidget: OneLineTextSkeleton()),

        SizedBox(height: 8),
        CustomLoadingShimmer(SkeletonWidget: OneLineTextSkeleton()),
        SizedBox(height: 8),
        SizedBox(
          height: 18,
          child: Row(
            children: [
              Expanded(
                child: CustomLoadingShimmer(
                  SkeletonWidget: OneLineTextSkeleton(),
                ),
              ),
              SizedBox(width: 64),
            ],
          ),
        ),
      ],
    );
  }
}
