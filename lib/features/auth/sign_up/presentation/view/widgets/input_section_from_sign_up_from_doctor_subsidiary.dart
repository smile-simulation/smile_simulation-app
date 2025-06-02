import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_text_styles.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import '../../../../../../generated/l10n.dart';

class InputSectionFromSignUpFromDoctorSubsidiary extends StatefulWidget {
  final TextEditingController qualificationController;
  final TextEditingController specializationController;
  final TextEditingController experienceController;
  final BuildContext context;

  const InputSectionFromSignUpFromDoctorSubsidiary({
    super.key,
    required this.qualificationController,
    required this.specializationController,
    required this.experienceController,
    required this.context,
  });

  @override
  State<InputSectionFromSignUpFromDoctorSubsidiary> createState() =>
      _InputSectionFromSignUpFromDoctorSubsidiaryState();
}

class _InputSectionFromSignUpFromDoctorSubsidiaryState
    extends State<InputSectionFromSignUpFromDoctorSubsidiary> {
  String? selectedDegree;
  String? selectedSpecialty;
  late List<String> degrees;
  late List<String> specialties;

  @override
  void initState() {
    super.initState();
    degrees = [
      S.of(widget.context).degree_bachelor,
      S.of(widget.context).degree_master,
      S.of(widget.context).degree_phd,
    ];
    specialties = [
      S.of(widget.context).degree_dentistry,
      S.of(widget.context).degree_orthodontics,
      S.of(widget.context).degree_oral_surgery,
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),

        Text(
          S.of(context).academicCertificate,
          style: AppTextStyles.formLabel(context),
        ),
        const SizedBox(height: 8),
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
                return DropdownMenuItem(value: degree, child: Text(degree));
              }).toList(),
          onChanged: (value) {
            setState(() {
              selectedDegree = value;
              widget.qualificationController.text = value!;
            });
          },
        ),

        const SizedBox(height: 16),

        Text(
          S.of(context).specialization,
          style: AppTextStyles.formLabel(context),
        ),
        const SizedBox(height: 8),
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
          value: selectedSpecialty,
          dropdownColor: AppColors.whiteColor,
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.greyLightColor,
          ),
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
              widget.specializationController.text = value!;
            });
          },
        ),

        const SizedBox(height: 16),

        CustomTextField(
          title: S.of(context).yearsOfExperience,
          hintText: "5",
          keyboardType: TextInputType.number,
          controller: widget.experienceController,
        ),
      ],
    );
  }
}
