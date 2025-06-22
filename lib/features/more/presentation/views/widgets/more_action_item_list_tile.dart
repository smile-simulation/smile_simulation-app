import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';

class MoreActionItemListTile extends StatelessWidget {
  const MoreActionItemListTile({
    super.key,
    required this.iconPath,
    required this.title,
    required this.onTap, this.trailing,
  });

  final String iconPath;
  final String title;
  final Function() onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: 70,
      child: Center(
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          onTap: onTap,
          trailing: trailing ?? Icon(
            Icons.arrow_forward_ios,
            color: AppColors.primaryColor,
          ),
          title: Text(
            title,
            style: AppTextStyles.subTitle1(context).copyWith(
              fontFamily: "NotoSansSC",
              color: AppColors.grayHeavyText_1Color,
            ),
          ),
          leading: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: AppColors.veryLightGreyColor,
              borderRadius: BorderRadius.circular(8),
            ),

            child: Center(child: SvgPicture.asset(iconPath,
            color: AppColors.primaryColor,
            )),
          ),
        ),
      ),
    );
  }
}
