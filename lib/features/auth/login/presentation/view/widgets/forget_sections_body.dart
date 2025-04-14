import 'package:flutter/material.dart';
import 'package:smile_simulation/features/auth/sign_up/presentation/view/widgets/pin_code_input.dart';

import '../../../../../../core/helper_functions/validator.dart';
import '../../../../../../core/widgets/custom_password_itext_field.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import '../../../../../../generated/l10n.dart';

class ForgetSectionsBody extends StatelessWidget {
   ForgetSectionsBody({super.key, required this.index, required this.OPt, required this.emailController, required this.newPasswordController, required this.confirmPasswordController});

  final int index;
  late  String OPt ;
  final TextEditingController emailController;
  final TextEditingController newPasswordController;
  final TextEditingController confirmPasswordController;

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
                    controller: emailController,
                    title: S.of(context).email,
                    hintText: "example@gmail.com",
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      return validatorOfEmail(value);
                    },

                  ),
                ]
                : index == 1
                ? [
                  PinInputStyles.buildPinInput(
                    onCompleted: (pin) {

                      OPt =pin ??"" ;
                      print(pin);
                      print(OPt)
;                    },
                  ),
                ]
                : [
              CustomPasswordTextField(
                controller: newPasswordController,
                title: S.of(context).password,
                hintText: "*********",
              ),
              CustomPasswordTextField(
                controller: confirmPasswordController,
                title: S.of(context).confirmPassword,
                hintText: "*********",
              ),
                ],
      ),
    );
  }
}
