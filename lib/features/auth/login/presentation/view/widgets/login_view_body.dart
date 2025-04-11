import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../constant.dart';
import '../../../../../../core/utils/app_text_styles.dart';
import '../../../../../../core/widgets/bottom_navigation_bar/bottom_nvaigation_view.dart';
import '../../../../../../core/widgets/custom_body_screen.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../generated/assets.dart';
import '../../../../../../generated/l10n.dart';
import '../forgot_view.dart';
import 'input_section_from_login_view.dart';
import 'login_with_media_section.dart';

class LogInViewBody extends StatelessWidget {
  const LogInViewBody({super.key});

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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          S.of(context).welcomeBack,
                          style: AppTextStyles.headline1(
                            context,
                          ).copyWith(color: Color(0xFF4F4F4F)),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 8),
                      SvgPicture.asset(Assets.imagesEmojiSmiling),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 24),
              InputSectionFromLogInView(),
              Align(
                alignment:
                    isArabic == 'ar'
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ForgetView.routeName);
                  },
                  child: Text(
                    S.of(context).forgotPassword,
                    style: AppTextStyles.caption1(context),
                  ),
                ),
              ),
              SizedBox(),
              CustomButton(
                title: S.of(context).signIn,
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    BottomNavigationView.routeName,
                  );
                },
              ),
              SizedBox(height: 12),

              LogInWithMediaSection(),
              SizedBox(height: 90),
            ],
          ),
        ),
      ),
    );
  }
}
