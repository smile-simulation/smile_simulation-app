import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';

class PostFooterActionItem extends StatelessWidget {
  const PostFooterActionItem({
    super.key,
    required this.onTap,
    required this.actionText,
    required this.icon,
    required this.isActive,
  });
  final Function() onTap;
  final String actionText;
  final IconData icon;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isActive ? AppColors.primaryColor : AppColors.greyColor,
          ),
          SizedBox(width: 6),
          Text(
            actionText,
            style: AppTextStyles.style14W400(context).copyWith(
              color: isActive ? AppColors.primaryColor : AppColors.greyColor,
            ),
          ),
        ],
      ),
    );
  }
}
