import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';

import 'other_user_cirle_image.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({super.key, required this.userName, required this.postDate});
  final String userName;
  final String postDate;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        OtherUserCircleImage(),
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
      ],
    );
  }
}
