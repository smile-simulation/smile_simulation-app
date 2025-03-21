import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smile_simulation/core/services/navigations.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/core/widgets/custom_button.dart';
import 'package:smile_simulation/core/widgets/custom_password_itext_field.dart';
import 'package:smile_simulation/core/widgets/custom_text_field.dart';

import 'package:smile_simulation/core/widgets/bottom_navigation_bar/bottom_nvaigation_view.dart';

import 'package:smile_simulation/features/auth/sign_up/presentation/view/sign_up_from_doctor_view.dart';
import 'package:smile_simulation/features/auth/sign_up/presentation/view/sign_up_from_user_view.dart';

import 'package:smile_simulation/generated/assets.dart';

import '../../../sign_up/presentation/view/manage_sign_up.dart';
import 'widgets/media_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);
  static const routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAuthAppbar(context,),
      bottomNavigationBar: Container(
        height: 80,
        color: AppColors.whiteColor,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("ليس لديك حساب؟", style: AppTextStyles.caption1(context)),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, ManageSignUpView.routeName);
                },
                child: Text(
                  "قم بالتسجيل الآن",
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
                Row(
                  children: [

                    SizedBox(height: 32),
                    Row(
                      children: [
                        Text(
                          "مرحبًا بك! سجل دخولك للمتابعة",
                          style: AppTextStyles.headline1(
                            context,
                          ).copyWith(color: Color(0xFF4F4F4F)),
                        ),
                        SizedBox(width: 4),
                        SvgPicture.asset(Assets.imagesEmojiSmiling),
                      ],
                    ),
                    SizedBox(height: 56),
                    CustomTextField(
                      title: "البريد الإلكتروني",
                      hintText: "example@gmail.com",
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 32),
                    CustomPasswordTextField(
                      hintText: "*********",
                      title: "كلمة المرور",
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "هل نسيت كلمة المرور؟",
                          style: AppTextStyles.caption1(context),
                        ),
                      ),
                    ),
                    SizedBox(height: 56),
                    CustomButton(
                      title: "تسجيل الدخول",
                      onPressed: () {
                        navigateTo(context, BottomNavigationView());
                      },
                    ),
                    SizedBox(height: 44),

                    Text(
                      "مرحبًا بك! سجل دخولك للمتابعة",
                      style: AppTextStyles.headline1(
                        context,
                      ).copyWith(color: Color(0xFF4F4F4F)),
                    ),
                    SizedBox(width: 4),
                    SvgPicture.asset(Assets.imagesEmojiSmiling),
                  ],
                ),
                SizedBox(height: 56),
                CustomTextField(
                  title: "البريد الإلكتروني",
                  hintText: "example@gmail.com",
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 32),
                CustomPasswordTextField(
                  hintText: "*********",
                  title: "كلمة المرور",
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "هل نسيت كلمة المرور؟",
                      style: AppTextStyles.caption1(context),
                    ),
                  ),
                ),
                SizedBox(height: 56),
                CustomButton(title: "تسجيل الدخول", onPressed: () {
              }),
                SizedBox(height: 44),
                Text(
                  "تسجيل الدخول بإستخدام",
                  style: AppTextStyles.caption1(context),
                ),
                SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
