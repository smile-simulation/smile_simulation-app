import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

class CustomeReminderButton extends StatelessWidget {
  final String text;

  const CustomeReminderButton({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          side: BorderSide(color: Colors.lightBlue.shade100),
          backgroundColor: Colors.lightBlue.shade50,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        ),
        onPressed: () {
          // Handle button press
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
              CircleAvatar(
              radius: 10,
              backgroundColor: AppColors.primaryColor,
              child: Icon(Icons.add, color: Colors.white, size: 16),
            ),
                SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
        
          
          ],
        ),
      ),
    );
  }
}
