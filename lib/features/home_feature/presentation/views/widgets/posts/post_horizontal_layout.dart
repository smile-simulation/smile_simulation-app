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
    return Expanded(
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [PostText(postContent: post.content??"No Content", maxLines: 5,)],
              
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Expanded(child: CustomPostImgae()),
                const SizedBox(height: 6),
                PostInteractions(
                  likeCount: post.likesCount.toString(),
                  commentCount: post.commentsCount.toString(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
