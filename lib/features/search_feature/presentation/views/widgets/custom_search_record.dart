import 'package:flutter/material.dart';
import 'package:smile_simulation/core/services/localization_helper.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/utils/app_translation.dart';

class CustomSearchRecord extends StatelessWidget {
  const CustomSearchRecord({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.access_time, color: Colors.grey),
      title:   Text(
                    LocalizationHelper.translate(TranslationKeys.mohamedHamed),
                    style: AppTextStyles.style16W400(
                      context,
                    ).copyWith(color: AppColors.blackColor),
        ),
      trailing:Icon(Icons.close, color: Colors.grey) 
    );
  }
}
