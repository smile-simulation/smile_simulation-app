import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/core/widgets/custom_button.dart';
import 'package:smile_simulation/features/auth/login/presentation/view/login_view.dart';
import '../../../../../constant.dart';
import '../../../../../generated/l10n.dart';
import 'widgets/input_section_from_sign_up_from_doctor_subsidiary.dart';

class SignUpFromDoctorSubsidiaryView extends StatelessWidget {
  const SignUpFromDoctorSubsidiaryView({super.key});

  static const routeName = '/sign-up-from-doctor-subsidiary';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAuthAppbar(context, isBack: true),

      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: CustomBodyScreen(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              SizedBox(height: 16),
              Align(
                alignment:
                    isArabic == 'ar'
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                child: Text(
                  S.of(context).enterPersonalInfo,
                  style: AppTextStyles.headline1(
                    context,
                  ).copyWith(color: Color(0xFF4F4F4F)),
                ),
              ),
              SizedBox(height: 8),
              InputSectionFromSignUpFromDoctorSubsidiary(),
              Expanded(child: SizedBox(height: 16)),
              Row(
                children: [
                  CustomButton(
                    title: S.of(context).saveData,
                    isMinWidth: true,
                    onPressed: () {
                      Navigator.pushNamed(context, LoginView.routeName);
                    },
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, LoginView.routeName);
                    },
                    child: Text(
                      S.of(context).skip,
                      style: AppTextStyles.button1(
                        context,
                      ).copyWith(color: AppColors.greyLightColor),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
