import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/core/widgets/custom_button.dart';
import 'package:smile_simulation/features/auth/sign_up/presentation/view/sign_up_from_doctor_view.dart';
import 'package:smile_simulation/features/auth/sign_up/presentation/view/sign_up_from_user_view.dart';
import 'package:smile_simulation/generated/assets.dart';

import '../../../../../generated/l10n.dart';

class ManageSignUpView extends StatelessWidget {
  const ManageSignUpView({Key? key}) : super(key: key);
  static const routeName = 'manageSignUp';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.whiteColor,
      appBar: customAppbar(context, isBack: true),

      body: Column(
        spacing: 16,
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                  Assets.imagesManageSignUpBackground,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                Image.asset(
                  Assets.fontsCairoBold,
                  height: MediaQuery.of(context).size.height / 1.7,
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomButton(
              title: S.of(context).registerAsDoctor,
              onPressed: () {
                Navigator.pushNamed(context, SignUpFromDoctorView.routeName);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomButton(
              title: S.of(context).registerAsUser,
              isSecondary: true,
              onPressed: () {
                Navigator.pushNamed(context, SignUpFromUserView.routeName);
              },
            ),
          ),

          SizedBox(height: 16),
        ],
      ),
    );
  }
}
