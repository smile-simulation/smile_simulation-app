import 'package:flutter/material.dart';
import 'package:smile_simulation/features/auth/login/presentation/view/widgets/login_view_body.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_auth_appbar.dart';
import '../../../../../generated/l10n.dart';
import '../../../sign_up/presentation/view/manage_sign_up.dart';

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
      body: LogInViewBody(),
    );
  }
}
