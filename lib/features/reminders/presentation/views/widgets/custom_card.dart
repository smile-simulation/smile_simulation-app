import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

class CustomcardScreen extends StatelessWidget {
  CustomcardScreen({super.key, required this.title, required this.imagePath});
  final String title;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.whiteColorForCard,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(
                imagePath,
                // height: 120,
                // fit: BoxFit.contain,
              ),
            ),
          ),

          // const Spacer(),
          Text(
            title,
            style: TextStyle(
              color:
                  AppColors
                      .grayHeavyText_1Color, // You can replace with AppColors.grayHeavyText_1Color
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 12),
          // const Spacer(),
        ],
      ),
    );
  }
}
