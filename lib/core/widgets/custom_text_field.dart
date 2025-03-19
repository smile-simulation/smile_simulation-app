import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    this.suffixIcon,
    this.onChanged,
    this.obscureText, required this.title, this.validator,
  });
  final String title;
  final String hintText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;

  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.formLabel(context)),
        SizedBox(height: 12),
        TextFormField(
          cursorColor: AppColors.primaryColor,
          onChanged: onChanged,
          validator:validator?? (value) {
            if (value == null || value.isEmpty) {
              return 'هذا الحقل مطلوب';
            }
            return null;
          },
          keyboardType: keyboardType,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xffF8F8F8),
            hintText: hintText,
            hintStyle: AppTextStyles.formLabel(
              context,
            ).copyWith(color: AppColors.greyLightColor),
            suffixIcon: suffixIcon,
            border: buildOutlineInputBorder(),
            enabledBorder: buildOutlineInputBorder(),
            focusedBorder: buildOutlineInputBorder(),
            disabledBorder: buildOutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(width: 1, color: Color(0xffF8F8F8)),
    );
  }
}
