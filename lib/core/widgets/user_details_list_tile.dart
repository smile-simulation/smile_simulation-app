import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
    this.iconColor,
  });
  final String title;
  final IconData icon;
  final Function()? onTap;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      minTileHeight: 36,
      leading: Icon(icon, color: iconColor ?? AppColors.primaryColor),
      title: Text(title, style: AppTextStyles.subTitle1(context)),
    );
  }
}
