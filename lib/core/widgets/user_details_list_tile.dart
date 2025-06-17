import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';

import '../../constant.dart';
import '../database/cache/cache_helper.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
    this.iconColor,  this.subTitle,
  });
  final String title;
  final String? subTitle;
  final IconData icon;
  final Function()? onTap;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      minTileHeight: 36,
      leading: Icon(icon, color: iconColor ?? AppColors.primaryColor),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyles.subTitle1(context)),

          Text(subTitle ?? "", style: AppTextStyles.placeHolder(context)),

        ],
      ),

    );
  }
}
