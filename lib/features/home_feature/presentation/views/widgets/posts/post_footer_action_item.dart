import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  final String icon;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            color: isActive ? AppColors.primaryColor : AppColors.greyColor,
          ),
          SizedBox(width: 6),
          Text(
            actionText,
            style: AppTextStyles.bodyText2(context).copyWith(
              color: isActive ? AppColors.primaryColor : AppColors.greyColor,
            ),
          ),
        ],
      ),
    );
  }
}
