import 'package:flutter/material.dart';
import 'package:smile_simulation/core/helper_functions/validator.dart';

import '../../../../../../core/widgets/custom_password_itext_field.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import '../../../../../../generated/l10n.dart';

class InputSectionFromLogInView extends StatelessWidget {
  const InputSectionFromLogInView({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        CustomTextField(
          controller: emailController,
          title: S.of(context).email,
          hintText: "example@gmail.com",
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            return validatorOfEmail(context, value);
          },
        ),
        CustomPasswordTextField(
          controller: passwordController,
          title: S.of(context).password,
          hintText: "*********",
        ),
      ],
    );
  }
}
