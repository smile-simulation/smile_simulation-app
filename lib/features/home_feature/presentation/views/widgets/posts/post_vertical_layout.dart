// ✅ ويدجت العرض الرأسي (Column)
import 'package:flutter/material.dart';
import 'package:smile_simulation/features/home_feature/data/models/post_model.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/widgets/posts/post_footer.dart';

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
        Visibility(
          visible: post.postImage != null,
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: CustomPostImage(image: post.postImage),
          ),
        ),
        const SizedBox(height: 16),

        /// Might Have Errors
        PostText(postContent: post.content ?? "no content"),

        PostInteractions(
          likeCount: post.likesCount.toString(),
          commentCount: post.commentsCount.toString(),
        ),
        const SizedBox(height: 16),
        PostFooter(post: post),

      ],
    );
  }
}
