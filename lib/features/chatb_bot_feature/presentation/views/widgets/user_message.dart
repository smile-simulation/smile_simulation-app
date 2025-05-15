import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

class UserMessage extends StatelessWidget {
  const UserMessage({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor,

          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),

        child: Text(text, style: TextStyle(color: Colors.white, fontSize: 16)),
      ),
    );
  }
}
