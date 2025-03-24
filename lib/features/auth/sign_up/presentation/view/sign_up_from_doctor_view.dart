import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smile_simulation/constant.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/core/widgets/custom_button.dart';
import 'package:smile_simulation/core/widgets/custom_password_itext_field.dart';
import 'package:smile_simulation/core/widgets/custom_text_field.dart';
import 'package:smile_simulation/features/auth/sign_up/presentation/view/sign_up_from_doctor_subsidiary_view.dart';
import 'package:smile_simulation/features/auth/sign_up/presentation/view/widgets/gender_section_from_sign_up_view.dart';
import 'package:smile_simulation/generated/assets.dart';
import 'package:smile_simulation/generated/l10n.dart';

class SignUpFromDoctorView extends StatelessWidget {
  const SignUpFromDoctorView({Key? key}) : super(key: key);
  static const routeName = 'signUpFromDoctorView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAuthAppbar(context, isBack: true),

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
                    S.of(context).registerNow,
                    style: AppTextStyles.headline1(
                      context,
                    ).copyWith(color: Color(0xFF4F4F4F)),
                  ),
                ),
                SizedBox(height: 24),
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
                GenderSectionFromSignUpView(
                  onSelected: (value) {
                    print(value);
                  },
                ),
                Align(
                  alignment:
                      isArabic == 'ar'
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                  child: Text(
                    S.of(context).uploadIDCard,
                    style: AppTextStyles.formLabel(context),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: AspectRatio(
                    aspectRatio: 2,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.veryLightGreyColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: SvgPicture.asset(Assets.imagesScanCamera),
                      ),
                    ),
                  ),
                ),
                CustomButton(
                  title: S.of(context).registerNow,
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      SignUpFromDoctorSubsidiaryView.routeName,
                    );
                  },
                ),

                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
