import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/core/widgets/custom_button.dart';
import 'package:smile_simulation/core/widgets/custom_text_field.dart';
import 'package:smile_simulation/features/auth/login/presentation/view/login_view.dart';

import '../../../../../constant.dart';
import '../../../../../generated/l10n.dart';

class SignUpFromDoctorSubsidiaryView extends StatefulWidget {
  const SignUpFromDoctorSubsidiaryView({super.key});

  static const routeName = '/sign-up-from-doctor-subsidiary';

  @override
  State<SignUpFromDoctorSubsidiaryView> createState() =>
      _SignUpFromDoctorSubsidiaryViewState();
}

class _SignUpFromDoctorSubsidiaryViewState
    extends State<SignUpFromDoctorSubsidiaryView> {
  String? selectedDegree;
  String? selectedSpecialty;
  final TextEditingController experienceController = TextEditingController();

  final List<String> degrees = ['بكالوريوس', 'ماجستير', 'دكتوراه'];
  final List<String> specialties = [
    'طب الأسنان',
    'تقويم الأسنان',
    'جراحة الفم',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAuthAppbar(context, isBack: true),

      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: CustomBodyScreen(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              SizedBox(height: 16),
              Align(
                alignment:
                    isArabic == 'ar'
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                child: Text(
                  S.of(context).enterPersonalInfo,
                  style: AppTextStyles.headline1(
                    context,
                  ).copyWith(color: Color(0xFF4F4F4F)),
                ),
              ),
              SizedBox(height: 8),
              Text(
                S.of(context).academicCertificate,
                style: AppTextStyles.formLabel(context),
              ),

              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xffF8F8F8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide.none,
                  ),
                ),
                hint: Text(
                  S.of(context).academicCertificate,
                  style: AppTextStyles.formLabel(
                    context,
                  ).copyWith(color: AppColors.greyLightColor),
                ),
                value: selectedDegree,
                dropdownColor: AppColors.whiteColor,
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.greyLightColor,
                ),
                items:
                    degrees.map((degree) {
                      return DropdownMenuItem(
                        value: degree,
                        child: Text(degree),
                      );
                    }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedDegree = value;
                  });
                },
              ),

              Text(S.of(context).specialization, style: AppTextStyles.formLabel(context)),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xffF8F8F8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide.none,
                  ),
                ),
                hint: Text(
                  S.of(context).specialization,
                  style: AppTextStyles.formLabel(
                    context,
                  ).copyWith(color: AppColors.greyLightColor),
                ),
                dropdownColor: AppColors.whiteColor,
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.greyLightColor,
                ),
                value: selectedSpecialty,
                items:
                    specialties.map((specialty) {
                      return DropdownMenuItem(
                        value: specialty,
                        child: Text(specialty),
                      );
                    }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedSpecialty = value;
                  });
                },
              ),

              CustomTextField(
                title: S.of(context).yearsOfExperience,
                hintText: " 5 ",
                keyboardType: TextInputType.number,
              ),
              Expanded(child: SizedBox(height: 16)),
              Row(
                children: [
                  CustomButton(
                    title: S.of(context).saveData,
                    isMinWidth: true,
                    onPressed: () {
                      Navigator.pushNamed(context, LoginView.routeName);
                    },
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, LoginView.routeName);
                    },
                    child: Text(
                      S.of(context).skip,
                      style: AppTextStyles.button1(
                        context,
                      ).copyWith(color: AppColors.greyLightColor),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
