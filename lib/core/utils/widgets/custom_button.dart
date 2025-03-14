import 'package:flutter/material.dart';
import 'package:smile_simulation/core/services/localization_helper.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    required this.buttonColor, required this.textColor,
  });

  final String text;
  final Color buttonColor;
  final Color textColor;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: buttonColor,
        padding: const EdgeInsets.symmetric(vertical: 15),
        minimumSize: const Size(double.infinity, 40),
      ),
      child: Text(
        LocalizationHelper.translate(text), style:  TextStyle(fontSize: 18, color: textColor)),
    );
  }
}
