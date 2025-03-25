import 'package:flutter/material.dart';

import '../../../../../../core/widgets/custom_password_itext_field.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import '../../../../../../generated/l10n.dart';

class InputSectionFromLogInView extends StatelessWidget {
  const InputSectionFromLogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        CustomTextField(
          title: S.of(context).email,
          hintText: "example@gmail.com",
          keyboardType: TextInputType.emailAddress,
        ),
        CustomPasswordTextField(
          hintText: "*********",
          title: S.of(context).password,
        ),
      ],
    );
  }
}
