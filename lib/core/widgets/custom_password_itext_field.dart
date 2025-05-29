import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smile_simulation/core/helper_functions/validator.dart';
import 'package:smile_simulation/core/widgets/custom_text_field.dart';
import 'package:smile_simulation/generated/assets.dart';

class CustomPasswordTextField extends StatefulWidget {
  const CustomPasswordTextField({
    super.key,
    required this.title,
    required this.hintText,
    this.controller, // ✅ إضافة `controller`
    this.onSaved,
  });

  final String title;
  final String hintText;
  final TextEditingController? controller; // ✅ دعم `TextEditingController`
  final void Function(String?)? onSaved;

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: widget.controller,
      keyboardType: TextInputType.visiblePassword,
      validator: (value) {
        return validatorOfPassword(context, value);
      },
      obscureText: _obscureText,
      onChanged: widget.onSaved,
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
