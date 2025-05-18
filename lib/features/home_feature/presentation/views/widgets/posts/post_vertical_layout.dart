// ✅ ويدجت العرض الرأسي (Column)
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/features/home_feature/presentation/cubits/post_details_cubit/post_details_cubit.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/widgets/posts/post_footer.dart';

import 'custom_post_image.dart';
import 'post_interactions.dart';
import 'post_text.dart';

class PostVerticalLayout extends StatelessWidget {
  const PostVerticalLayout({super.key});

  @override
  Widget build(BuildContext context) {
    PostDetailsCubit cubit = context.read<PostDetailsCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: cubit.post.postImage != null,
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: CustomPostImage(),
          ),
        ),
        const SizedBox(height: 16),

        /// Might Have Errors
        PostText(postContent: cubit.post.content ?? "no content"),

        PostInteractions(
          likeCount: cubit.post.likesCount.toString(),
          commentCount: cubit.post.commentsCount.toString(),
        ),
        const SizedBox(height: 16),
        PostFooter(post: cubit.post, isPostView: true),
      ],
    );
  }
}
