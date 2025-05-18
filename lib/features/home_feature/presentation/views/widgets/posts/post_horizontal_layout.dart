import 'package:flutter/material.dart';
import 'package:smile_simulation/features/home_feature/data/models/post_model.dart';
import 'custom_post_image.dart';
import 'post_interactions.dart';
import 'post_text.dart';

// ✅ ويدجت العرض الأفقي (Row)
class PostHorizontalLayout extends StatelessWidget {
  const PostHorizontalLayout({super.key, required this.post});
  final PostModel post;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: post.content != null,
              child: Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PostText(
                      postContent: post.content ?? "No Content",
                      maxLines: 5,
                    ),
                  ],
                ),
              ),
            ),
            if (post.postImage != null) SizedBox(width: 8),
            if (post.postImage != null)
              Expanded(flex: 4, child: CustomPostImage()),
          ],
        ),
        const SizedBox(height: 6),
        PostInteractions(
          likeCount: post.likesCount.toString(),
          commentCount: post.commentsCount.toString(),
        ),
      ],
    );
  }
}
