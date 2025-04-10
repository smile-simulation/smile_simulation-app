import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/features/home_feature/data/models/post_model.dart';

import 'post_horizontal_layout.dart';
import 'post_footer.dart';
import 'post_header.dart';
import 'post_vertical_layout.dart';

class CustomPost extends StatelessWidget {
  const CustomPost({
    super.key,
    this.onTap,
    required this.currentUser,
    this.clickablePostImage = true,
    required this.isPostView,
    required this.post,
  });
  final Function()? onTap;
  final bool currentUser;
  final bool clickablePostImage;
  final bool isPostView;
  final PostModel post;
  @override
  Widget build(BuildContext context) {
    if (isPostView) {
      return Container(
        // height: 400,
        padding: EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.veryLightGreyColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PostHeader(
              userName: post.userName,
              postDate: post.postDate,
              currentUser: currentUser,
              clickablePostImage: clickablePostImage,
            ),
            SizedBox(height: 4),
            PostVerticalLayout(post: post),
            SizedBox(height: 12),
            PostFooter(isPostView: isPostView, post: post),
          ],
        ),
      );
    } else {
      return InkWell(
        onTap: onTap,
        child: Container(
          height: 224,
          padding: EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.veryLightGreyColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PostHeader(
                userName: post.userName,
                postDate: post.postDate,
                currentUser: currentUser,
                clickablePostImage: clickablePostImage,
              ),
              SizedBox(height: 4),
              PostHorizontalLayout(post: post),
              SizedBox(height: 12),
              PostFooter(isPostView: isPostView, post: post),
            ],
          ),
        ),
      );
    }
  }
}
