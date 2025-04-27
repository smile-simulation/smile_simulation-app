import 'package:flutter/material.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/features/auth/sign_up/presentation/view/widgets/sign_up_from_doctor_body_view.dart';

class SignUpFromDoctorView extends StatelessWidget {
  const SignUpFromDoctorView({Key? key}) : super(key: key);
  static const routeName = 'signUpFromDoctorView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, isBack: true),

      body: SignUpFromDoctorBodyView(),
    );
  }
}
