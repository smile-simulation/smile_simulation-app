import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/constant.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/core/widgets/custom_button.dart';
import 'package:smile_simulation/features/auth/login/presentation/manage/cubits/forget_password_cubit/forget_password_cubit.dart';
import 'package:smile_simulation/features/auth/login/presentation/view/login_view.dart';
import 'package:smile_simulation/features/auth/login/presentation/view/widgets/forget_sections_body.dart';

import '../../../../../core/helper_functions/custom_error.dart';
import '../../../../../generated/l10n.dart';
import '../../data/models/forget_model/forget_model.dart';

class ForgetView extends StatefulWidget {
  const ForgetView({super.key});

  static const String routeName = "/forgot";

  @override
  State<ForgetView> createState() => _ForgotViewState();
}

class _ForgotViewState extends State<ForgetView> {
  int index = 0;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

 final String Opt ="";
  ForgetModel forgetModel = ForgetModel();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) async {
        if (state is SendCodeFailure) {
          await customError(context, massage: state.message);
        }
        if (state is ConfirmNumFailure) {
          await customError(context, massage: state.message);
        }
        if (state is ChangePasswordFailure) {
          await customError(context, massage: state.message);
        }
        if (state is SendCodeSuccess || state is ConfirmNumSuccess) {
          index++;
        }
        if (state is ChangePasswordSuccess) {
          await customSuccess(context, massage: state.message);
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: customAuthAppbar(
            context,
            isBack: true,
            title:
                index == 0
                    ? S.of(context).forgotPassword
                    : index == 1
                    ? S.of(context).verificationCode
                    : S.of(context).resetPassword,
          ),
          bottomNavigationBar: Container(
            height: 60,
            color: AppColors.whiteColor,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).rememberPassword,
                    style: AppTextStyles.caption1(context),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, LoginView.routeName);
                    },
                    child: Text(
                      S.of(context).signIn,
                      style: AppTextStyles.caption1(
                        context,
                      ).copyWith(color: AppColors.primaryColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: CustomBodyScreen(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: AppColors.whiteColor,
                  child: Column(
                    spacing: 16,
                    children: [
                      SizedBox(height: 16),
                      Text(
                        index == 0
                            ? S.of(context).enterEmail
                            : index == 1
                            ? S.of(context).enterVerificationCode
                            : S.of(context).enterNewPassword,
                        style: AppTextStyles.headline2(
                          context,
                        ).copyWith(color: Color(0xFF4F4F4F)),
                      ),
                      ForgetSectionsBody(
                        index: index,
                        OPt: Opt ,
                        emailController: emailController,
                        newPasswordController: newPasswordController,
                        confirmPasswordController: confirmPasswordController,
                      ),
                      CustomButton(
                        isLoading:
                            context.watch<ForgetPasswordCubit>().state
                                is ChangePasswordLoading ||
                            context.watch<ForgetPasswordCubit>().state
                                is SendCodeLoading ||
                            context.watch<ForgetPasswordCubit>().state
                                is ConfirmNumLoading,
                        title:
                            index == 0 || index == 1
                                ? S.of(context).confirm
                                : S.of(context).resetPassword,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            autovalidateMode = AutovalidateMode.disabled;
                            logger.d("Dssd" + Opt!);
                            setState(() {
                              index == 0
                                  ? context
                                      .read<ForgetPasswordCubit>()
                                      .sendCode(
                                        email: emailController.text.trim(),
                                      )
                                  : index == 1
                                  ? context
                                      .read<ForgetPasswordCubit>()
                                      .confirmNum(
                                        email: emailController.text.trim(),
                                        codeOTP: Opt ,
                                      )
                                  : context
                                      .read<ForgetPasswordCubit>()
                                      .changePassword(
                                        email: emailController.text.trim(),
                                        token: forgetModel.data!.token!,
                                        newPassword:
                                            newPasswordController.text.trim(),
                                        confirmPassword:
                                            confirmPasswordController.text
                                                .trim(),
                                      );
                            });
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                            setState(() {});
                          }
                        },
                      ),
                      Expanded(child: SizedBox(height: 16)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
