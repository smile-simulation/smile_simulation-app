import 'package:flutter/material.dart';
import 'package:smile_simulation/core/helper_functions/validator.dart';
import '../../../../../../core/widgets/custom_password_itext_field.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import '../../../../../../generated/l10n.dart';

class InputSectionFromSignUpFromUserView extends StatelessWidget {
  const InputSectionFromSignUpFromUserView({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.ageController,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController ageController;

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
        CustomTextField(
          controller: ageController,
          title: S.of(context).age,
          hintText: "25",
          keyboardType: TextInputType.number,
          validator: (value) {
            return validatorOfAge(value);
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
