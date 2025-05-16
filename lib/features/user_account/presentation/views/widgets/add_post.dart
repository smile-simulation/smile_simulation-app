import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_icon.dart';
import 'package:smile_simulation/generated/l10n.dart';

import '../../../../../constant.dart';
import '../../../../../core/database/cache/cache_helper.dart';
import '../../../../../generated/assets.dart';

class AddPost extends StatelessWidget {
  const AddPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: double.minPositive,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage:
                CacheHelper().getMap(key: userData)!['image'] != null
                    ? NetworkImage(
                      CacheHelper().getMap(key: userData)!['image'],
                    )
                    : const AssetImage(Assets.imagesUser),
            radius: 20,
          ),
          SizedBox(width: 4),
          Expanded(
            child: Container(
              height: 52,
              padding: EdgeInsets.symmetric(horizontal: 8),
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                color: AppColors.veryLightGreyColor,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                S.of(context).createNewPost,
                style: AppTextStyles.bodyText1(
                  context,
                ).copyWith(color: AppColors.greyColor),
              ),
            ),
          ),
          SizedBox(width: 10),
          CustomIcon(
            icon: Icons.image,
            color: AppColors.primaryColor,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
