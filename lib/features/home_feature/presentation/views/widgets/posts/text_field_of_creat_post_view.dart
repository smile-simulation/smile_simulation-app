
import 'package:flutter/material.dart';
import 'package:smile_simulation/core/services/localization_helper.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_translation.dart';

class TestField extends StatelessWidget {
  const TestField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Icon(Icons.image, color: AppColors.primaryColor),
        ),
        hintText: LocalizationHelper.translate(
          TranslationKeys.postContent,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 2.0,
          ), // Border color when focused
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white.withValues()),
        ),
      ),
    );
  }
}