import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:smile_simulation/core/helper_functions/show_modal_bottom_sheet.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';

import '../../../../../user_account/presentation/views/user_account_view.dart';
import '../current_user_circle_image.dart';
import 'my_post_more_actions_bottom_sheet.dart';
import 'other_user_cirle_image.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({
    super.key,
    required this.userName,
    required this.postDate,
    required this.currentUser,
    this.clickablePostImage = true,
  });
  final String userName;
  final String postDate;
  final bool currentUser;
  final bool clickablePostImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          currentUser
              ? CurrentUserCircleImage(
                color: AppColors.primaryColor,
                borderWidth: 4,
                onTap: () {
                  if (clickablePostImage) {
                    log(clickablePostImage.toString());
                    Navigator.pushNamed(
                      context,
                      UserAccountView.routeName,
                      arguments: true,
                    );
                  }
                },
              )
              : OtherUserCircleImage(
                onTap: () {
                  if (clickablePostImage) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return UserAccountView(currentUser: false);
                        },
                      ),
                    );
                  }
                },
              ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: AppTextStyles.headline3(
                  context,
                ).copyWith(color: AppColors.primaryColor),
              ),
              Text(postDate, style: AppTextStyles.caption2(context)),
            ],
          ),
          Spacer(),
          currentUser
              ? IconButton(
                onPressed: () {
                  customShowModalBottomSheet(
                    context: context,
                    child: MyPostMoreActionsBottomSheet(),
                  );
                },

                icon: Icon(
                  Icons.more_horiz_outlined,
                  color: AppColors.greyColor,
                  size: 28,
                ),
              )
              : SizedBox(),
        ],
      ),
    );
  }
}
