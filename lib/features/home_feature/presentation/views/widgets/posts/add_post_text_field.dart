import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/generated/l10n.dart';

class AddPostTextField extends StatefulWidget {
  const AddPostTextField({
    super.key,
    required this.controller,
    required this.onPressed,
  });

  final TextEditingController controller;
  final Function() onPressed;
  @override
  State<AddPostTextField> createState() => _AddPostTextFieldState();
}

class _AddPostTextFieldState extends State<AddPostTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      maxLines: null,
      minLines: 1,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: widget.onPressed,
          icon: Icon(Icons.image, color: AppColors.primaryColor),
        ),
        hintText: S.of(context).postContent,
        hintStyle: AppTextStyles.headline2(
          context,
        ).copyWith(color: AppColors.greyColor),

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.transparent,
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
