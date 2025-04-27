import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';

import '../../constant.dart';

AppBar customAppbar(
  BuildContext context, {
  String? title,
  bool isBack = false,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    leading:
        isBack
            ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: AppColors.whiteColor,
              ),
            )
            : SizedBox(),
    title:
        title != null
            ? Text(
              title,
              style: AppTextStyles.headline1(
                context,
              ).copyWith(color: AppColors.whiteColor),
            )
            : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Visibility(
                  visible: isArabic == 'en',
                  child: Text(
                    'Smile',
                    style: AppTextStyles.headline1(
                      context,
                    ).copyWith(color: AppColors.whiteColor),
                  ),
                ),
                Text(
                  ' simulation ',
                  style: AppTextStyles.headline1(context).copyWith(
                    color: AppColors.lightGreyColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Visibility(
                  visible: isArabic == 'ar',
                  child: Text(
                    'Smile',
                    style: AppTextStyles.headline1(
                      context,
                    ).copyWith(color: AppColors.whiteColor),
                  ),
                ),
              ],
            ),
  );
}
