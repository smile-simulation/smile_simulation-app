import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';

import '../../../../../../generated/l10n.dart';

enum Gender { male, female }

class GenderSectionFromSignUpView extends StatefulWidget {
  const GenderSectionFromSignUpView({super.key, required this.onSelected});

  final Function(String) onSelected;

  @override
  State<GenderSectionFromSignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<GenderSectionFromSignUpView> {
  Gender? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
<<<<<<< HEAD
        Text('الجنس', style: AppTextStyles.formLabel(context)),
=======
        Text(
          S.of(context).gender,
          style: AppTextStyles.formLabel(context)
        ),
>>>>>>> main
        Row(
          children: <Widget>[
            Expanded(
              child: RadioListTile<Gender>(
                contentPadding: EdgeInsets.zero,
<<<<<<< HEAD
                title: Text('ذكر', style: AppTextStyles.formLabel(context)),
=======
                title: Text(
                  S.of(context).male,
                  style: AppTextStyles.formLabel(context)
                ),
>>>>>>> main
                value: Gender.male,
                groupValue: _selectedGender,
                activeColor: AppColors.primaryColor,
                onChanged: (Gender? value) {
                  setState(() {
                    _selectedGender = value;
                    widget.onSelected("male");
                  });
                },
              ),
            ),
            Expanded(
              child: RadioListTile<Gender>(
                contentPadding: EdgeInsets.zero,
<<<<<<< HEAD
                title: Text('انثى', style: AppTextStyles.formLabel(context)),
=======
                title: Text(
                  S.of(context).female,
                  style: AppTextStyles.formLabel(context)
                ),
>>>>>>> main
                value: Gender.female,
                groupValue: _selectedGender,
                activeColor: AppColors.primaryColor,
                onChanged: (Gender? value) {
                  setState(() {
                    _selectedGender = value;
                    widget.onSelected("female");
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
