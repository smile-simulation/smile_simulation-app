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
    this.fillColor = const Color(0xffF8F8F8),
    this.borderColor = const Color(0xffF8F8F8),
    this.hintTextColor = AppColors.greyLightColor,
    this.cursorColor = AppColors.primaryColor,
    this.suffixIconColor = AppColors.greyColor, // 🆕 Default color
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

  // Customizable colors
  final Color fillColor;
  final Color borderColor;
  final Color hintTextColor;
  final Color cursorColor;
  final Color suffixIconColor; // 🆕 New variable

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
<<<<<<< HEAD
          cursorColor: cursorColor,
          onSaved: onSaved,
          validator: validator ??
=======
          cursorColor: AppColors.primaryColor,
          onChanged: onSaved,
          readOnly: readOnly,
          validator:
              validator ??
>>>>>>> 1015d4cf7188ea9308fca60a64087e5cdb3644d9
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
            fillColor: fillColor,
            hintText: hintText,
            hintStyle: AppTextStyles.formLabel(context).copyWith(
              color: hintTextColor,
            ),
            suffixIcon: suffixIcon != null
                ? IconTheme(
                    data: IconThemeData(color: suffixIconColor),
                    child: suffixIcon!,
                  )
                : null,
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
      borderSide: BorderSide(width: 1, color: borderColor),
    );
  }

  OutlineInputBorder _focusedOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(width: 1, color: AppColors.primaryColor),
    );
  }
}
