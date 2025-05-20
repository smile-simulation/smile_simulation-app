import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    this.controller,
    this.suffixIcon,
    this.onSaved,
    this.obscureText = false,
    this.title,
    this.validator,
    this.readOnly = false,
  });

  final String? title;
  final String hintText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(title!, style: AppTextStyles.formLabel(context)),
        if (title != null) const SizedBox(height: 12),
        TextFormField(
          controller: controller,
          cursorColor: AppColors.primaryColor,
          onChanged: onSaved,
          readOnly: readOnly,
          validator:
              validator ??
              (value) {
                if (value == null || value.isEmpty) {
                  return 'هذا الحقل مطلوب';
                }
                return null;
              },
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xffF8F8F8),
            hintText: hintText,
            hintStyle: AppTextStyles.formLabel(
              context,
            ).copyWith(color: AppColors.greyLightColor),
            suffixIcon: suffixIcon,
            border: _buildOutlineInputBorder(),
            enabledBorder: _buildOutlineInputBorder(),
            focusedBorder: _focusedOutlineInputBorder(),
            disabledBorder: _buildOutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(width: 1, color: Color(0xffF8F8F8)),
    );

  }
  OutlineInputBorder _focusedOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide:  BorderSide(width: 1, color: AppColors.primaryColor),
    );

  }
}
