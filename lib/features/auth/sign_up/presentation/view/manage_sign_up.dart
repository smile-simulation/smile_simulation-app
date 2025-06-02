import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/widgets/custom_button.dart';
import 'package:smile_simulation/features/auth/sign_up/presentation/view/sign_up_from_doctor_view.dart';
import 'package:smile_simulation/features/auth/sign_up/presentation/view/sign_up_from_user_view.dart';
import 'package:smile_simulation/generated/assets.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../main.dart';

class ManageSignUpView extends StatelessWidget {
  const ManageSignUpView({Key? key}) : super(key: key);
  static const routeName = 'manageSignUp';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent ,
        leading:
         IconButton(
          onPressed:

                  () {
                Navigator.pop(context);
              },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: AppColors.whiteColor,
          ),
        ),

        title:
      Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Visibility(
              visible: isArabic == 'ar',
              child: Text(
                'Smile',
                style: AppTextStyles.headline1(
                  context,
                ).copyWith(color: AppColors.whiteColor),
              ),
            ),
            Text(
              ' simulation ',
              style: AppTextStyles.headline1(context).copyWith(
                color: AppColors.lightGreyColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            Visibility(
              visible: isArabic == 'en',
              child: Text(
                'Smile',
                style: AppTextStyles.headline1(
                  context,
                ).copyWith(color: AppColors.whiteColor),
              ),
            ),
          ],
        ),
      ),

      body: Column(
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
                  Assets.imagesManageSignup,
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
