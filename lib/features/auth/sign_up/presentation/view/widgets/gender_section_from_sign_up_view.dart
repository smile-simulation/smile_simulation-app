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
        Text(
          S.of(context).gender,
          style: AppTextStyles.formLabel(context)
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: RadioListTile<Gender>(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  S.of(context).male,
                  style: AppTextStyles.formLabel(context)
                ),
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
                title: Text(
                  S.of(context).female,
                  style: AppTextStyles.formLabel(context)
                ),
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
