import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_assets.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

class CurrentUserCircleImage extends StatelessWidget {
  const CurrentUserCircleImage({
    super.key,
    required this.color,
    required this.borderWidth,
  });
  final Color color;
  final double borderWidth;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(borderWidth),
      decoration: BoxDecoration(
        color: AppColors.grayHeavyText_1Color,
        gradient: LinearGradient(
          colors: [color.withAlpha(235), color.withAlpha(80)],
          transform: GradientRotation(-90),
        ),
        shape: BoxShape.circle,
      ),
      child: CircleAvatar(
        backgroundImage: AssetImage(AppAssets.userImage),
        radius: 20,
      ),
    );
  }
}
