import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_assets.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

class Currentusercircleicon extends StatelessWidget {
  const Currentusercircleicon({super.key, required this.radius});
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.grayHeavyText_1Color,
        gradient: LinearGradient(
          colors: [
            AppColors.whiteColor.withAlpha(235),
            AppColors.whiteColor.withAlpha(80),
          ],
          transform: GradientRotation(-90),
        ),
        shape: BoxShape.circle,
      ),
      child: CircleAvatar(
        backgroundImage: AssetImage(AppAssets.userImage),
        backgroundColor: AppColors.blackColor,
        radius: radius,
      ),
    );
  }
}
