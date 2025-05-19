import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';


enum Marital { single, married }

class MaritalSectionFromSignUpView extends StatefulWidget {
  const MaritalSectionFromSignUpView({
    super.key,
    required this.onSelected,
    this.initialValue, // ✅ القيمة المبدئية
  });

  final Function(String) onSelected;
  final String? initialValue; // 'single' أو 'married'

  @override
  State<MaritalSectionFromSignUpView> createState() => _MaritalSectionState();
}

class _MaritalSectionState extends State<MaritalSectionFromSignUpView> {
  Marital? _selectedMarital;

  @override
  void initState() {
    super.initState();

    if (widget.initialValue == 'single') {
      _selectedMarital = Marital.single;
    } else if (widget.initialValue == 'married') {
      _selectedMarital = Marital.married;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "الحالة الإجتماعية",
          style: AppTextStyles.formLabel(context),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: RadioListTile<Marital>(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  "أعزب",
                  style: AppTextStyles.formLabel(context),
                ),
                value: Marital.single,
                groupValue: _selectedMarital,
                activeColor: AppColors.primaryColor,
                onChanged: (Marital? value) {
                  setState(() {
                    _selectedMarital = value;
                    widget.onSelected("single");
                  });
                },
              ),
            ),
            Expanded(
              child: RadioListTile<Marital>(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  "متزوج",
                  style: AppTextStyles.formLabel(context),
                ),
                value: Marital.married,
                groupValue: _selectedMarital,
                activeColor: AppColors.primaryColor,
                onChanged: (Marital? value) {
                  setState(() {
                    _selectedMarital = value;
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
