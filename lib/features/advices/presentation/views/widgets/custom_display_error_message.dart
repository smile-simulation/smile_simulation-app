
import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

class CustomDisplayErrorMessage extends StatelessWidget {
  const CustomDisplayErrorMessage({super.key, required this.errorMessage});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          errorMessage,
          textAlign: TextAlign.center,
          style: const TextStyle(color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
