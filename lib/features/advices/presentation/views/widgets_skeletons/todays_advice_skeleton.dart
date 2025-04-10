import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

class TodaysAdviceSkeleton extends StatelessWidget {
  const TodaysAdviceSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 198,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.primaryColor.withAlpha(100),
      ),
      child: Container(),
    );
  }
}
