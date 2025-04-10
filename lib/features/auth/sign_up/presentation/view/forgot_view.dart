import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/core/widgets/custom_button.dart';
import 'package:smile_simulation/features/auth/login/presentation/view/login_view.dart';
import 'package:smile_simulation/features/auth/sign_up/presentation/view/widgets/forget_sections_body.dart';

import '../../../../../generated/l10n.dart';

class ForgetView extends StatefulWidget {
  const ForgetView({super.key});

  static const String routeName = "/forgot";

  @override
  State<ForgetView> createState() => _ForgotViewState();
}

class _ForgotViewState extends State<ForgetView> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAuthAppbar(
        context,
        isBack: true,
        title:
            index == 0
                ? S.of(context).forgotPassword
                : index == 1
                ? S.of(context).verificationCode
                : S.of(context).resetPassword,
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: AppColors.whiteColor,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).rememberPassword,
                style: AppTextStyles.caption1(context),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, LoginView.routeName);
                },
                child: Text(
                  S.of(context).signIn,
                  style: AppTextStyles.caption1(
                    context,
                  ).copyWith(color: AppColors.primaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: CustomBodyScreen(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: AppColors.whiteColor,
            child: Column(
              spacing: 16,
              children: [
                SizedBox(height: 16),
                Text(
                  index == 0
                      ? S.of(context).enterEmail
                      : index == 1
                      ? S.of(context).enterVerificationCode
                      : S.of(context).enterNewPassword,
                  style: AppTextStyles.headline2(
                    context,
                  ).copyWith(color: Color(0xFF4F4F4F)),
                ),
                ForgetSectionsBody(index: index),
                CustomButton(
                  title:
                      index == 0 || index == 1
                          ? S.of(context).confirm
                          : S.of(context).resetPassword,
                  onPressed: () {
                    setState(() {
                      index++;
                    });
                  },
                ),
                Expanded(child: SizedBox(height: 16)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
