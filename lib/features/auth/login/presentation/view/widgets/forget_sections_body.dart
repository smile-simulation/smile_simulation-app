import 'package:flutter/material.dart';
import 'package:smile_simulation/features/auth/sign_up/presentation/view/widgets/pin_code_input.dart';

import '../../../../../../core/widgets/custom_password_itext_field.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import '../../../../../../generated/l10n.dart';

class ForgetSectionsBody extends StatelessWidget {
  const ForgetSectionsBody({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Column(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.center,
        children:
            index == 0
                ? [
                  CustomTextField(
                    title: S.of(context).email,
                    hintText: "example@gmail.com",
                    keyboardType: TextInputType.emailAddress,
                  ),
                ]
                : index == 1
                ? [
                  PinInputStyles.buildPinInput(
                    onCompleted: (pin) {
                      //  print("User entered PIN: $pin");
                    },
                  ),
                ]
                : [
                  CustomPasswordTextField(
                    title: S.of(context).password,
                    hintText: "*********",
                  ),
                  CustomPasswordTextField(
                    title: S.of(context).confirmPassword,
                    hintText: "*********",
                  ),
                ],
      ),
    );
  }
}
