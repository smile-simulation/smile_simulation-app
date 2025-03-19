import 'package:flutter/material.dart';
import 'package:smile_simulation/generated/assets.dart';

class CustomPostImgae extends StatelessWidget {
  const CustomPostImgae({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.center,
      decoration: BoxDecoration(
        // color: AppColors.grayHeavyText_1Color,
        borderRadius: BorderRadius.circular(8),
      ),

      child: Image.asset(Assets.imagesEngMahmoudMagdy, fit: BoxFit.contain),
    );
  }
}
