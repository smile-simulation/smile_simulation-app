import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import '../../cubits/posts_cubit/posts_cubit.dart';
import '../post_view.dart';
import 'posts/custom_post.dart';

class PostsListView extends StatelessWidget {
  const PostsListView({
    super.key,
    this.clickablePostImage = true,
    required this.currentUser,
  });

  final bool currentUser;
  final bool clickablePostImage;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsCubit, PostsState>(
      builder: (context, state) {
        if (state is GetPostsSuccess) {
          final posts = state.posts;

          return ListView.separated(
            itemCount: posts.length,
            separatorBuilder: (_, __) => const SizedBox(height: 28),
            itemBuilder: (context, index) {
              final post = posts[index];
              return CustomPost(
                clickablePostImage: clickablePostImage,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    PostView.routeName,
                    arguments: post,
                  );
                },
                currentUser: currentUser,
                isPostView: false,
                post: post,
              );
            },
          );
        } else if (state is GetPostsFailure) {
          return const Center(child: Text("خطأ في تحميل المنشورات"));
        } else {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor),
          );
        }
      },
    );
  }
}
