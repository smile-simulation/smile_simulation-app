import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

class CustomBodyScreen extends StatelessWidget {
  const CustomBodyScreen({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(45),
          topRight: Radius.circular(45),
        ),
      ),
      child: child,
    );
  }
}
