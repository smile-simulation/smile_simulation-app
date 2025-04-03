import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/features/auth/sign_up/presentation/manage/cubits/sign_up_user_cubit.dart';

import '../../../../../../constant.dart';
import '../../../../../../core/helper_functions/custom_error.dart';
import '../../../../../../core/utils/app_text_styles.dart';
import '../../../../../../core/widgets/custom_body_screen.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../generated/l10n.dart';
import '../../manage/cubits/sign_up_state.dart';
import 'gender_section_from_sign_up_view.dart';
import 'input_section_from_sign_up_from_user_view.dart';

class SignUpFromUserBodyView extends StatefulWidget {
  const SignUpFromUserBodyView({super.key});

  @override
  State<SignUpFromUserBodyView> createState() => _SignUpFromUserBodyViewState();
}

class _SignUpFromUserBodyViewState extends State<SignUpFromUserBodyView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  int gender = 2;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: CustomBodyScreen(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
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
                    S.of(context).registerNow,
                    style: AppTextStyles.headline1(
                      context,
                    ).copyWith(color: Color(0xFF4F4F4F)),
                  ),
                ),
                SizedBox(height: 24),
                InputSectionFromSignUpFromUserView(
                  emailController: emailController,
                  passwordController: passwordController,
                  confirmPasswordController: confirmPasswordController,
                  nameController: nameController,
                  ageController: ageController,
                ),
                GenderSectionFromSignUpView(
                  onSelected: (value) {
                    if (value == 'male') {
                      gender = 0;
                    } else if (value == 'female') {
                      gender = 1;
                    }
                  },
                ),
                CustomButton(
                  title: S.of(context).registerNow,

                  isLoading:
                      context.watch<SignUpUserCubit>().state is SignUpLoading
                          ? true
                          : false,

                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      autovalidateMode = AutovalidateMode.disabled;

                      setState(() {
                        if (gender == 2) {
                        customError(context, massage: "  الرجاء اختيار نوع الجنس");
                          return;
                        }

                        context.read<SignUpUserCubit>().signUpFromUser(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                          confirmPassword:
                              confirmPasswordController.text.trim(),
                          fullName: nameController.text.trim(),
                          age: int.tryParse(ageController.text.trim()) ?? 0,
                          image: '',
                          gender: gender == 0 ? 'male' : 'female',
                        );
                      });
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
