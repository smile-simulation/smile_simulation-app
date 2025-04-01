import 'package:flutter/material.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';

import 'widgets/sign_up_from_user_body_view.dart';

class SignUpFromUserView extends StatelessWidget {
  const SignUpFromUserView({Key? key}) : super(key: key);
  static const routeName = 'signUpFromUserView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAuthAppbar(context, isBack: true),

      body: SignUpFromUserBodyView(),
    );
  }
}


