import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/widgets/current_user_circle_image.dart';
import 'package:smile_simulation/features/user_account/presentation/views/user_account_view.dart';

import 'other_user_cirle_image.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({
    super.key,
    required this.userName,
    required this.postDate,
    required this.currentUser,
  });
  final String userName;
  final String postDate;
  final bool currentUser;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        currentUser
            ? CurrentUserCircleImage(
              color: AppColors.primaryColor,
              borderWidth: 4,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return UserAccountView();
                    },
                  ),
                );
              },
            )
            : OtherUserCircleImage(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return UserAccountView();
                    },
                  ),
                );
              },
            ),
        SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userName,
              style: AppTextStyles.style16W700(
                context,
              ).copyWith(color: AppColors.primaryColor),
            ),
            Text(postDate, style: AppTextStyles.style10W400(context)),
          ],
        ),
        Spacer(),
        currentUser
            ? IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_horiz_outlined,
                color: AppColors.greyColor,
                size: 28,
              ),
            )
            : SizedBox(),
      ],
    );
  }
}
