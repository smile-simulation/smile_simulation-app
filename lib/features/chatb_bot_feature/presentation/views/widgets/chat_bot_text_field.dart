import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

class ChatBotTextField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSendMessage;

  ChatBotTextField({required this.controller, required this.onSendMessage});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGreyColor),
          borderRadius: BorderRadius.circular(30),
        ),
        hintText: "تحدث مع الشات",
        hintStyle: TextStyle(color: AppColors.greyColor),
        suffixIcon: IconButton(
          icon: Icon(Icons.send, color: AppColors.primaryColor),
          onPressed: onSendMessage,
        ),
      ),
    );
  }
}
