import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smile_simulation/features/auth/sign_up/presentation/view/widgets/upload_id_section_from_sign_up_from_doctor_view.dart';

import '../../../../../../constant.dart';
import '../../../../../../core/helper_functions/custom_error.dart';
import '../../../../../../core/utils/app_text_styles.dart';
import '../../../../../../core/widgets/custom_body_screen.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../generated/l10n.dart';
import '../sign_up_from_doctor_subsidiary_view.dart';
import 'gender_section_from_sign_up_view.dart';
import 'input_section_from_sign_up_from_doctor_view.dart';

class SignUpFromDoctorBodyView extends StatefulWidget {
  const SignUpFromDoctorBodyView({super.key});

  @override
  State<SignUpFromDoctorBodyView> createState() =>
      _SignUpFromDoctorBodyViewState();
}

class _SignUpFromDoctorBodyViewState extends State<SignUpFromDoctorBodyView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();

  int gender = 2;

  File card = File('');

  bool isCorrect = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();

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
                InputSectionFromSignUpFromDoctorView(
                  emailController: emailController,
                  passwordController: passwordController,
                  confirmPasswordController: confirmPasswordController,
                  nameController: nameController,
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
                UploadIDSectionFromSignUpFromDoctorView(
                  onImagePicked: (image, isDoctor) {
                    setState(() {
                      card = image;
                      isCorrect = isDoctor;
                    });
                  },
                ),
                CustomButton(
                  title: S.of(context).registerNow,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      autovalidateMode = AutovalidateMode.disabled;

                      setState(() {
                        if (isCorrect == false) {
                          customError(
                            context,
                            massage: " الرجاء اختيار صورة الهوية صحيحة",
                          );
                          return;
                        }
                        if (gender == 2) {
                          customError(
                            context,
                            massage: "  الرجاء اختيار نوع الجنس",
                          );
                          return;
                        }

                        Navigator.pushNamed(
                          context,
                          arguments:  {
                            'email': emailController.text,
                            'password': passwordController.text,
                            'confirmPassword': confirmPasswordController.text,
                            'name': nameController.text,
                            'gender': gender,
                            'card': card,
                            'isCorrect': isCorrect,
                          },
                          SignUpFromDoctorSubsidiaryView.routeName,
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
