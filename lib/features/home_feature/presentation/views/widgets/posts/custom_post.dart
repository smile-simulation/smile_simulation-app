import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

import 'post_body.dart';
import 'post_footer.dart';
import 'post_header.dart';

class CustomPost extends StatelessWidget {
  const CustomPost({
    super.key,
    this.onTap,
    required this.currentUser,
    this.clickablePostImage = true,
  });
  final Function()? onTap;
  final bool currentUser;
  final bool clickablePostImage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 198,
        padding: EdgeInsets.all(8),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.veryLightGreyColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PostHeader(
              userName: 'محمود مجدي',
              postDate: 'يومان',
              currentUser: currentUser,
              clickablePostImage: clickablePostImage,
            ),
            SizedBox(height: 4),
            Expanded(child: PostBody()),
            SizedBox(height: 8),
            PostFooter(),
          ],
        ),
      ),
    );
  }
}
