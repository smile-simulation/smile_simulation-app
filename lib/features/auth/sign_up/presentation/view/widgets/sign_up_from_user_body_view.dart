import 'package:flutter/material.dart';

import '../../../../../../constant.dart';
import '../../../../../../core/utils/app_text_styles.dart';
import '../../../../../../core/widgets/custom_body_screen.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../generated/l10n.dart';
import 'gender_section_from_sign_up_view.dart';
import 'input_section_from_sign_up_from_user_view.dart';

class SignUpFromUserBodyView extends StatelessWidget {
  const SignUpFromUserBodyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
              InputSectionFromSignUpFromUserView(),
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
    );
  }
}
