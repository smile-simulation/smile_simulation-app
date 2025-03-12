import 'package:flutter/material.dart';
import 'package:smile_simulation/core/services/localization_helper.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';

class UserDetailsListTIle extends StatelessWidget {
  const UserDetailsListTIle({
    super.key,
    required this.title,
    required this.icon,
  });
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      minTileHeight: 36,
      leading: Icon(icon, color: AppColors.primaryColor),
      title: Text(
        LocalizationHelper.translate(title),
        style: AppTextStyles.style16W700(context),
      ),
    );
  }
}
