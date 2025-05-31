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
    required this.addressController,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController ageController;
  final TextEditingController addressController;

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
            return validatorOfName(context, value);
          },
        ),
        CustomTextField(
          controller: emailController,
          title: S.of(context).email,
          hintText: "example@gmail.com",
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            return validatorOfEmail(context, value);
          },
        ),
        CustomTextField(
          controller: ageController,
          title: S.of(context).age,
          hintText: "25",
          keyboardType: TextInputType.number,
          validator: (value) {
            return validatorOfAge(context, value);
          },
        ),
        CustomTextField(
          controller: addressController,
          title: S.of(context).address,
          hintText: "123 Main St, City, Country",
          keyboardType: TextInputType.text,
          validator: (value) {
            return validatorOfAddress(context, value);
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
