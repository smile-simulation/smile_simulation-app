import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/app_colors.dart';

class CustomLoadingShimmer extends StatelessWidget {
  const CustomLoadingShimmer({super.key, required this.SkeletonWidget});
  final Widget SkeletonWidget;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.greyLightColor.withOpacity(0.1),
      highlightColor: AppColors.greyLightColor.withOpacity(0.4),
      period: const Duration(milliseconds: 1200),
      direction:
          Localizations.localeOf(context).languageCode == 'ar'
              ? ShimmerDirection.rtl
              : ShimmerDirection.ltr,
      child: SkeletonWidget,
    );
  }
}
