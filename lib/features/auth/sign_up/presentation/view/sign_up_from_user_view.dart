import 'package:flutter/material.dart';
import 'package:smile_simulation/constant.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/core/widgets/custom_button.dart';
import 'package:smile_simulation/core/widgets/custom_password_itext_field.dart';
import 'package:smile_simulation/core/widgets/custom_text_field.dart';
import 'package:smile_simulation/features/auth/sign_up/presentation/view/widgets/gender_section_from_sign_up_view.dart';

import '../../../../../generated/l10n.dart';

class SignUpFromUserView extends StatelessWidget {
  const SignUpFromUserView({Key? key}) : super(key: key);
  static const routeName = 'signUpFromUserView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAuthAppbar(context, isBack: true,),

      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: CustomBodyScreen(
          child: SingleChildScrollView(
            child: Column(
              spacing: 16,
              children: [
                SizedBox(height: 16),
                Align(
                  alignment:
                      isArabic == 'ar'
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                  child: Text(
                    S .of(context).registerNow,
                    style: AppTextStyles.headline1(
                      context,
                    ).copyWith(color: Color(0xFF4F4F4F)),
                  ),
                ),
                SizedBox(height: 24),
                CustomTextField(
                  title:S .of(context).fullName,
                  hintText: "Mohamed Ahmed",
                  keyboardType: TextInputType.text,
                ),
                CustomTextField(
                  title: S .of(context).email,
                  hintText: "example@gmail.com",
                  keyboardType: TextInputType.emailAddress,
                ),
                CustomTextField(
                  title: S .of(context).age,
                  hintText: "25",
                  keyboardType: TextInputType.number,
                ),
                CustomPasswordTextField(
                  title: S .of(context).password,
                  hintText: "*********",
                ),
                CustomPasswordTextField(
                  title: S .of(context).confirmPassword,
                  hintText: "*********",
                ),
                GenderSectionFromSignUpView(
                  onSelected: (value) {
                    print(value);
                  },
                ),
                CustomButton(title:S.of(context).registerNow, onPressed: () {}),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
