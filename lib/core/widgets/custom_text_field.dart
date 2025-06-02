import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';

import '../../generated/l10n.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    this.controller,
    this.suffixIcon,
    this.onChanged,
    this.obscureText = false,
    this.title,
    this.validator,
    this.fillColor = const Color(0xffF8F8F8),
    this.borderColor = const Color(0xffF8F8F8),
    this.hintTextColor = AppColors.greyLightColor,
    this.cursorColor = AppColors.primaryColor,
    this.suffixIconColor = AppColors.greyColor,
    this.readOnly,
  });
  final bool? readOnly;
  final String? title;
  final String hintText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final bool obscureText;

  final Color fillColor;
  final Color borderColor;
  final Color hintTextColor;
  final Color cursorColor;
  final Color suffixIconColor;

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
          cursorColor: cursorColor,
          onChanged: onChanged,
          validator:
              validator ??
              (value) {
                if (value == null || value.isEmpty) {
                  return S.of(context).field_required;
                }
                return null;
              },
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: InputDecoration(
            filled: true,
            fillColor: fillColor,
            hintText: hintText,
            hintStyle: AppTextStyles.formLabel(
              context,
            ).copyWith(color: hintTextColor),
            suffixIcon:
                suffixIcon != null
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
