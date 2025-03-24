import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/core/widgets/custom_button.dart';
import 'package:smile_simulation/core/widgets/custom_password_itext_field.dart';
import 'package:smile_simulation/core/widgets/custom_text_field.dart';

import 'package:smile_simulation/core/widgets/bottom_navigation_bar/bottom_nvaigation_view.dart';

import 'package:smile_simulation/generated/assets.dart';

import '../../../../../constant.dart';
import '../../../../../generated/l10n.dart';
import '../../../sign_up/presentation/view/forgot_view.dart';
import '../../../sign_up/presentation/view/manage_sign_up.dart';
import 'widgets/media_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);
  static const routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAuthAppbar(context),
      bottomNavigationBar: Container(
        height: 60,
        color: AppColors.whiteColor,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).noAccount,
                style: AppTextStyles.caption1(context),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, ManageSignUpView.routeName);
                },
                child: Text(
                  S.of(context).registerNow,
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 32),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            S.of(context).welcomeBack,
                            style: AppTextStyles.headline1(
                              context,
                            ).copyWith(color: Color(0xFF4F4F4F)),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 8),
                        SvgPicture.asset(Assets.imagesEmojiSmiling),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 56),
                CustomTextField(
                  title: S.of(context).email,
                  hintText: "example@gmail.com",
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 32),
                CustomPasswordTextField(
                  hintText: "*********",
                  title: S.of(context).password,
                ),
                Align(
                  alignment:
                      isArabic == 'ar'
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, ForgetView.routeName);
                    },
                    child: Text(
                      S.of(context).forgotPassword,
                      style: AppTextStyles.caption1(context),
                    ),
                  ),
                ),
                SizedBox(height: 56),
                CustomButton(
                  title: S.of(context).signIn,
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      BottomNavigationView.routeName,
                    );
                  },
                ),
                SizedBox(height: 44),

                Text(
                  S.of(context).signInWith,
                  style: AppTextStyles.caption1(context),
                ),
                SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MediaButton(title: 'Google', image: Assets.imagesGoogle),
                    MediaButton(
                      title: 'Facebook',
                      image: Assets.imagesFacebook,
                    ),
                  ],
                ),
                SizedBox(height: 90),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
