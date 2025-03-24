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
import 'package:smile_simulation/features/auth/sign_up/presentation/view/widgets/sign_up_from_doctor_body_view.dart';
import 'package:smile_simulation/generated/assets.dart';
import 'package:smile_simulation/generated/l10n.dart';

class SignUpFromDoctorView extends StatelessWidget {
  const SignUpFromDoctorView({Key? key}) : super(key: key);
  static const routeName = 'signUpFromDoctorView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAuthAppbar(context, isBack: true),

      body: SignUpFromDoctorBodyView(),
    );
  }
}
