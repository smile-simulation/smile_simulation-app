import 'package:flutter/material.dart';

import '../../../../../../core/helper_functions/validator.dart';
import '../../../../../../core/widgets/custom_password_itext_field.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import '../../../../../../generated/l10n.dart';

class InputSectionFromSignUpFromDoctorView extends StatelessWidget {
  const InputSectionFromSignUpFromDoctorView({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
  });
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        CustomTextField(
          controller: nameController,
          title: S.of(context).fullName,
          hintText: "Mohamed Ahmed",
          keyboardType: TextInputType.text,
          validator: (value) {
            return validatorOfName(value);
          },
        ),
        CustomTextField(
          controller: emailController,
          title: S.of(context).email,
          hintText: "example@gmail.com",
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            return validatorOfEmail(value);
          },
        ),
        CustomPasswordTextField(
          controller: passwordController,
          title: S.of(context).password,
          hintText: "*********",
        ),
        CustomPasswordTextField(
          controller: confirmPasswordController,
          title: S.of(context).confirmPassword,
          hintText: "*********",
        ),
      ],
    );
  }
}
