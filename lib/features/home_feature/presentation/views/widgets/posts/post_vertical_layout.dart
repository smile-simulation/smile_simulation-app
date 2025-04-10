// ✅ ويدجت العرض الرأسي (Column)
import 'package:flutter/material.dart';
import 'package:smile_simulation/features/home_feature/data/models/post_model.dart';

import 'custom_post_image.dart';
import 'post_interactions.dart';
import 'post_text.dart';

class PostVerticalLayout extends StatelessWidget {
  const PostVerticalLayout({super.key, required this.post});
  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          height: 136,
          child: const CustomPostImgae(),
        ),
        const SizedBox(height: 8),
        PostText(postContent: post.content),
        // const Spacer(),
        PostInteractions(
          likeCount: post.likes.toString(),
          commentCount: post.commentsCount.toString(),
        ),
      ],
    );
  }
}
