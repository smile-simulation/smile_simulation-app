

import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

class ContentSkeleton extends StatelessWidget {
  const ContentSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.greyLightColor,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
