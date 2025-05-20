import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';

import '../../../../../generated/assets.dart';

class UserAccountHeader extends StatelessWidget {
  const UserAccountHeader({
    super.key,
    required this.currentUser,
    required this.userName,
    required this.userImage,
  });
  final bool currentUser;
  final String userName;
  final String? userImage;
  @override
  Widget build(BuildContext context) {
    log("this user image: $userImage");
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
                child: CircleAvatar(
                  backgroundImage:
                      userImage == null
                          ? AssetImage(Assets.imagesUser)
                          : NetworkImage(userImage!),
                  radius: 20,
                ),
              ),
              Visibility(
                visible: currentUser,
                child: Positioned(
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
              ),
            ],
          ),
          Text(
            userName,
            style: AppTextStyles.headline2(
              context,
            ).copyWith(color: AppColors.whiteColor),
          ),
        ],
      ),
    );
  }
}
