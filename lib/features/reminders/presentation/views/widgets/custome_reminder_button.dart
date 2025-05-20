import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

class CustomeReminderButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomeReminderButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // خدت عرض وارتفاع الشاشة
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: SizedBox(
        width: screenWidth * 0.5, // العرض 80% من الشاشة
        height:
            screenHeight * 0.05, // الارتفاع 7% من الشاشة (تقدر تزوده أو تقلله)
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.lightBlue.shade50,
            side: BorderSide(color: Colors.lightBlue.shade100),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 10,
                backgroundColor: AppColors.primaryColor,
                child: Icon(Icons.add, color: Colors.white, size: 16),
              ),
              const SizedBox(width: 8),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
