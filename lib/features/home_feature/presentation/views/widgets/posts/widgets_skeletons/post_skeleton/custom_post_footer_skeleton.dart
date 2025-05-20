import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/widgets/custom_loading_shimmer.dart';

class CustomPostFooterSkeleton extends StatelessWidget {
  const CustomPostFooterSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Spacer(flex: 1),
        Expanded(
          flex: 2,

          child: CustomLoadingShimmer(
            SkeletonWidget: Container(
              decoration: BoxDecoration(color: AppColors.grayHeavyText_1Color),
            ),
          ),
        ),
        // Spacer(),
        SizedBox(width: 8),
        Expanded(
          flex: 2,

          child: CustomLoadingShimmer(
            SkeletonWidget: Container(
              decoration: BoxDecoration(color: AppColors.grayHeavyText_1Color),
            ),
          ),
        ),
        // Spacer(flex: 1),
      ],
    );
  }
}
