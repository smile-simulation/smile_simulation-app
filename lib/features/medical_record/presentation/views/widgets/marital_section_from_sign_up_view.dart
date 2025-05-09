import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';

import '../../../../../../generated/l10n.dart';

enum Marital { single, married }

class MaritalSectionFromSignUpView extends StatefulWidget {
  const MaritalSectionFromSignUpView({super.key, required this.onSelected});

  final Function(String) onSelected;

  @override
  State<MaritalSectionFromSignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<MaritalSectionFromSignUpView> {
  Marital? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "الحالة الإجتماعية", // Localized text for "Gender"
          style: AppTextStyles.formLabel(context),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: RadioListTile<Marital>(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  S.of(context).male, // Localized text for "Male"
                  style: AppTextStyles.formLabel(context),
                ),
                value: Marital.single,
                groupValue: _selectedGender,
                activeColor: AppColors.primaryColor,
                onChanged: (Marital? value) {
                  setState(() {
                    _selectedGender = value;
                    widget.onSelected("single");
                  });
                },
              ),
            ),
            Expanded(
              child: RadioListTile<Marital>(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  S.of(context).female, // Localized text for "Female"
                  style: AppTextStyles.formLabel(context),
                ),
                value: Marital.married,
                groupValue: _selectedGender,
                activeColor: AppColors.primaryColor,
                onChanged: (Marital? value) {
                  setState(() {
                    _selectedGender = value;
                    widget.onSelected("married");
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
