// import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/widgets/posts/other_user_cirle_image.dart';

import '../../../../../constant.dart';
import '../../../../../core/database/cache/cache_helper.dart';
import '../../../../../generated/assets.dart';

class UserAccountHeader extends StatelessWidget {
  const UserAccountHeader({super.key, required this.currentUser});
  final bool currentUser;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 164 + kToolbarHeight + 40,
      child: Column(
        children: [
          SizedBox(height: kToolbarHeight + 40),
          Stack(
            children: [
              SizedBox(
                height: 120,
                width: 120,
                child:
                    currentUser
                        ?CircleAvatar(
                      backgroundImage:
                      CacheHelper().getMap(key: userData)!['image'] != null
                          ? NetworkImage(CacheHelper().getMap(key: userData)!['image'])
                          : const AssetImage(Assets.imagesUser),
                      radius: 20,
                    )
                        : OtherUserCircleImage(onTap: () {}),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.whiteColor,
                    foregroundColor: AppColors.primaryColor,
                  ),
                  onPressed: () {},
                  icon: Icon(Icons.add),
                ),
              ),
            ],
          ),
          Text(
            "محمود مجدي",
            style: AppTextStyles.headline2(
              context,
            ).copyWith(color: AppColors.whiteColor),
          ),
        ],
      ),
    );
  }
}
