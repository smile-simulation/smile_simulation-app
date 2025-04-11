import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../constant.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_text_styles.dart';
import '../../../../../../core/widgets/custom_body_screen.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../generated/l10n.dart';
import '../../manage/cubits/sign_up_doctor_cubit/sign_up_doctor_cubit.dart';
import '../../manage/cubits/sign_up_doctor_cubit/sign_up_doctor_state.dart';
import 'input_section_from_sign_up_from_doctor_subsidiary.dart';

class SignUpFromDoctorSubsidiaryBodyView extends StatefulWidget {
  const SignUpFromDoctorSubsidiaryBodyView({
    super.key,
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.gender,
    required this.cardImage,
    required this.isCorrect,
  });

  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final int gender;

  final File cardImage;
  final bool isCorrect;

  @override
  State<SignUpFromDoctorSubsidiaryBodyView> createState() =>
      _SignUpFromDoctorSubsidiaryBodyViewState();
}

class _SignUpFromDoctorSubsidiaryBodyViewState
    extends State<SignUpFromDoctorSubsidiaryBodyView> {
  final TextEditingController qualificationController = TextEditingController();
  final TextEditingController specializationController =
  TextEditingController();
  final TextEditingController experienceController = TextEditingController();

  @override
  void dispose() {
    qualificationController.dispose();
    specializationController.dispose();
    experienceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: CustomBodyScreen(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Align(
              alignment:
              isArabic == 'ar'
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Text(
                S.of(context).enterPersonalInfo,
                style: AppTextStyles.headline1(
                  context,
                ).copyWith(color: const Color(0xFF4F4F4F)),
              ),
            ),
            const SizedBox(height: 8),
            InputSectionFromSignUpFromDoctorSubsidiary(
              qualificationController: qualificationController,
              specializationController: specializationController,
              experienceController: experienceController,
            ),
            const Spacer(),
            Row(
              children: [
                CustomButton(
                  title: S.of(context).saveData,
                  isMinWidth: true,
                  isLoading:
                  context.watch<SignUpDoctorCubit>().state
                  is SignUpDoctorLoading
                      ? true
                      : false,

                  onPressed: () {
                    logger.d(
                      "experience: ${experienceController.text}  qualification: ${qualificationController.text}  specialization: ${specializationController.text}",
                    );
                    context.read<SignUpDoctorCubit>().signUpFromDoctor(
                      email: widget.email,
                      password: widget.password,
                      confirmPassword: widget.confirmPassword,
                      fullName: widget.name,
                      gender: widget.gender == 1 ? 'male' : 'female',

                      experience: int.tryParse(experienceController.text) ?? 0,
                      isCorrect: widget.isCorrect,
                      qualification: qualificationController.text,
                      specialization: specializationController.text,
                      image: File(''),
                      card: widget.cardImage,
                    );
                  },
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    logger.d(
                      "experience: ${experienceController.text}  qualification: ${qualificationController.text}  specialization: ${specializationController.text}",
                    );
                    context.read<SignUpDoctorCubit>().signUpFromDoctor(
                      email: widget.email,
                      password: widget.password,
                      confirmPassword: widget.confirmPassword,
                      fullName: widget.name,
                      gender: widget.gender == 1 ? 'male' : 'female',

                      experience: int.tryParse(experienceController.text) ?? 0,
                      isCorrect: widget.isCorrect,
                      qualification: qualificationController.text,
                      specialization: specializationController.text,
                      image: File(''),
                      card: widget.cardImage,
                    );  },
                  child: Text(
                    S.of(context).skip,
                    style: AppTextStyles.button1(
                      context,
                    ).copyWith(color: AppColors.greyLightColor),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
