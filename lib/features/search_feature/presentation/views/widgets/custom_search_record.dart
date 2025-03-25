import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/generated/l10n.dart';

class CustomSearchRecord extends StatelessWidget {
  const CustomSearchRecord({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.access_time, color: Colors.grey),
      title: Text(
        S.of(context).mohamedHamed,
        style: AppTextStyles.style16W400(
          context,
        ).copyWith(color: AppColors.blackColor),
      ),
      trailing: Icon(Icons.close, color: Colors.grey),
    );
  }
}
