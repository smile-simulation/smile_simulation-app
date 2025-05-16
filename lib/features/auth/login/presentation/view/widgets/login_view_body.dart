import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/features/auth/login/presentation/manage/cubits/login_cubit/login_cubit.dart';

import '../../../../../../constant.dart';
import '../../../../../../core/utils/app_text_styles.dart';
import '../../../../../../core/widgets/custom_body_screen.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../generated/assets.dart';
import '../../../../../../generated/l10n.dart';
import '../forgot_view.dart';
import 'input_section_from_login_view.dart';
import 'login_with_media_section.dart';

class LogInViewBody extends StatefulWidget {
  const LogInViewBody({super.key});

  @override
  State<LogInViewBody> createState() => _LogInViewBodyState();
}

class _LogInViewBodyState extends State<LogInViewBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: CustomBodyScreen(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
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
                  InputSectionFromLogInView(
                    emailController: emailController,
                    passwordController: passwordController,
                  ),
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
                        style: AppTextStyles.caption1(
                          context,
                        ).copyWith(color: AppColors.primaryColor),
                      ),
                    ),
                  ),
                  SizedBox(),
                  CustomButton(
                    title: S.of(context).signIn,
                    isLoading:
                        context.watch<LoginCubit>().state is LoginLoading
                            ? true
                            : false,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        autovalidateMode = AutovalidateMode.disabled;

                        context.read<LoginCubit>().login(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        );
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                  ),

                  SizedBox(height: 12),

                  LogInWithMediaSection(),
                  SizedBox(height: 90),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
