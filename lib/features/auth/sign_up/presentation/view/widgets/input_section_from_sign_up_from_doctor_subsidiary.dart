import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_text_styles.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import '../../../../../../generated/l10n.dart';

class InputSectionFromSignUpFromDoctorSubsidiary extends StatefulWidget {
  const InputSectionFromSignUpFromDoctorSubsidiary({super.key});

  @override
  State<InputSectionFromSignUpFromDoctorSubsidiary> createState() => _InputSectionFromSignUpFromDoctorSubsidiaryState();
}

class _InputSectionFromSignUpFromDoctorSubsidiaryState extends State<InputSectionFromSignUpFromDoctorSubsidiary> {

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
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
      ],
    );
  }
}
