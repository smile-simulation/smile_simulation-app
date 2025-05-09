import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import '../../cubits/posts_cubit/posts_cubit.dart';
import '../post_view.dart';
import 'posts/custom_post.dart';

class PostsListViewBuilder extends StatelessWidget {
  const PostsListViewBuilder({
    super.key,
    this.isSliver = false,
    this.clickablePostImage = true,
    required this.currentUser,
  });

  final bool isSliver;
  final bool currentUser;
  final bool clickablePostImage;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsCubit, PostsState>(
      builder: (context, state) {
        if (state is GetPostsSuccess) {
          final posts = state.posts;

          Widget buildItem(BuildContext context, int index) {
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
          }

          return isSliver
              ? SliverList.separated(
                itemBuilder: buildItem,
                separatorBuilder: (_, __) => const SizedBox(height: 28),
                itemCount: posts.length,
              )
              : ListView.separated(
                itemBuilder: buildItem,
                separatorBuilder: (_, __) => const SizedBox(height: 28),
                itemCount: posts.length,
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
