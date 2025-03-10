import 'package:flutter/material.dart';
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
        shape: BoxShape.circle,
      ),
      child: CircleAvatar(
        backgroundColor: AppColors.whiteColor,
        radius: radius,
      ),
    );
  }
}
