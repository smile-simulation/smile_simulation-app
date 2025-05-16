import 'package:flutter/material.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/generated/l10n.dart';

import '../../../../../../constant.dart';
import '../../../../../../core/database/cache/cache_helper.dart';
import '../../../../../../generated/assets.dart';

class EditPostViewBody extends StatelessWidget {
  const EditPostViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBodyScreen(
      child: Column(
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
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
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  S.of(context).mohamedHamed,
                  overflow: TextOverflow.ellipsis,

                  style: AppTextStyles.headline2(
                    context,
                  ).copyWith(color: AppColors.blackColor),
                ),
              ),
              SizedBox(width: 50),
              Icon(Icons.image, color: AppColors.primaryColor),
            ],
          ),
          SizedBox(height: 30),

          // PostBody(postView: false),
          Spacer(),
          // CustomButton(
          //   text: S.of(context).editPost,
          //   buttonColor: AppColors.primaryColor,
          //   textColor: AppColors.whiteColor,
          //   onPressed: () {},
          // ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
