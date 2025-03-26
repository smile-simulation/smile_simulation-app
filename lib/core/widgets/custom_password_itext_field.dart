import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smile_simulation/core/widgets/custom_text_field.dart';
import 'package:smile_simulation/generated/assets.dart';

class CustomPasswordTextField extends StatefulWidget {
  const CustomPasswordTextField({
    super.key,
    required this.title,
    required this.hintText,

    this.onChanged,
  });

  final String title;
  final String hintText;

  final void Function(String?)? onChanged;

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      keyboardType: TextInputType.visiblePassword,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'يجب إدخال كلمة المرور';
        }
        if (!RegExp(r'[A-Z]').hasMatch(value)) {
          return 'يجب أن تحتوي على حرف كبير واحد على الأقل [A-Z]';
        }
        if (!RegExp(r'[a-z]').hasMatch(value)) {
          return 'يجب أن تحتوي على حرف صغير واحد على الأقل [a-z]';
        }
        if (!RegExp(r'[0-9]').hasMatch(value)) {
          return 'يجب أن تحتوي على رقم واحد على الأقل [0-9]';
        }
        if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
          return 'يجب أن تحتوي على رمز خاص واحد على الأقل [@-#-..]';
        }
        if (value.length < 8) {
          return 'يجب أن تكون على الأقل 8 أحرف';
        }
        return null; // كلمة المرور صالحة
      },
      obscureText: _obscureText,
      onChanged: widget.onChanged,
      hintText: widget.hintText,
      title: widget.title,

      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
        icon: SvgPicture.asset(Assets.imagesInput),
      ),
    );
  }
}
