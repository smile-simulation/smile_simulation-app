import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_loading_shimmer.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/widgets/posts/widgets_skeletons/user_image_skeleton.dart';

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
                child: SizedBox(
                  height: 120,
                  width: 120,
                  child:
                      userImage == null
                          ? CircleAvatar(
                            backgroundImage: AssetImage(Assets.imagesUser),
                            radius: 20,
                          )
                          : CircleAvatar(
                            radius: 20,
                            backgroundColor:
                                Colors.grey[200], // Or any neutral background
                            child: ClipOval(
                              child: CachedNetworkImage(
                                imageUrl: userImage!,
                                fit: BoxFit.cover,
                                width: 120,
                                height: 120,
                                placeholder:
                                    (context, url) => CustomLoadingShimmer(
                                      SkeletonWidget: UserImageSkeleton(),
                                    ),
                                errorWidget:
                                    (context, url, error) => Icon(Icons.error),
                              ),
                            ),
                          ),
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
