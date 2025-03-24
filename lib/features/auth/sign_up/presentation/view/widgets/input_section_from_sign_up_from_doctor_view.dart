import 'package:flutter/material.dart';

import '../../../../../../core/widgets/custom_password_itext_field.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import '../../../../../../generated/l10n.dart';

class InputSectionFromSignUpFromDoctorView extends StatelessWidget {
  const InputSectionFromSignUpFromDoctorView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        CustomTextField(
          title: S.of(context).fullName,
          hintText: "Mohamed Ahmed",
          keyboardType: TextInputType.text,
        ),
        CustomTextField(
          title: S .of(context).email,
          hintText: "example@gmail.com",
          keyboardType: TextInputType.emailAddress,
        ),
        CustomPasswordTextField(
          title:S .of(context).password,
          hintText: "*********",
        ),
        CustomPasswordTextField(
          title: S.of(context).confirmPassword,
          hintText: "*********",
        ),
      ],
    );
  }
}
