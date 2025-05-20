import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/features/user_account/presentation/managers/get_user_posts_cubit/get_user_posts_cubit.dart';
import '../../../../home_feature/presentation/views/widgets/posts/custom_post.dart';

class PostsSliverListView extends StatelessWidget {
  const PostsSliverListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserPostsCubit, GetUserPostsState>(
      builder: (context, state) {
        if (state is GetUserPostSuccess) {
          final posts = state.posts;

          return SliverList.separated(
            itemCount: posts.length,
            separatorBuilder: (_, __) => const SizedBox(height: 28),
            itemBuilder: (context, index) {
              final post = posts[index];
              return CustomPost(
                clickablePostImage: false,

                currentUser: true,
                post: post,
              );
            },
          );
        } else if (state is GetUserPostFailture) {
          return const SliverToBoxAdapter(
            child: Center(child: Text("خطأ في تحميل المنشورات")),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 32),
              child: Center(
                child: CircularProgressIndicator(color: AppColors.primaryColor),
              ),
            ),
          );
        }
      },
    );
  }
}
