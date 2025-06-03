import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/generated/l10n.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../cubits/posts_cubit/posts_cubit.dart';
import 'posts/custom_post.dart';
import 'posts/widgets_skeletons/post_skeleton/post_skeleton.dart';

class PostsListView extends StatefulWidget {
  const PostsListView({
    super.key,
    required this.currentUser,
    this.clickablePostImage = true,
  });

  final bool currentUser;
  final bool clickablePostImage;

  @override
  State<PostsListView> createState() => _PostsListViewState();
}

class _PostsListViewState extends State<PostsListView> {
  bool isLoadingMore = false;
  bool isCheckingNewPosts = false;

  @override
  void initState() {
    super.initState();
    context.read<PostsCubit>().fetchPosts(isInitialLoad: true);
  }

  Future<void> _onRefresh() async {
    await context.read<PostsCubit>().refreshPosts();
  }

  bool _onScrollNotification(ScrollNotification notification) {
    final cubit = context.read<PostsCubit>();

    if (notification is ScrollUpdateNotification) {
      final maxScroll = notification.metrics.maxScrollExtent;
      final currentScroll = notification.metrics.pixels;

      if (currentScroll >= maxScroll - 200 &&
          !isLoadingMore &&
          !cubit.hasReachedEnd) {
        isLoadingMore = true;
        cubit.fetchPosts().then((_) {
          isLoadingMore = false;
        });
      }

      if (currentScroll <= 50 && !isCheckingNewPosts) {
        isCheckingNewPosts = true;
        cubit.fetchNewPosts().then((_) {
          isCheckingNewPosts = false;
        });
      }
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsCubit, PostsState>(
      builder: (context, state) {
        log(state.toString());

        final cubit = context.read<PostsCubit>();
        final posts = cubit.posts;

        if (state is PostsInitial || state is PostsLoading) {
          return ListView.separated(
            padding: EdgeInsets.zero,
            itemCount: 8,
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              return PostSkeleton();
            },
          );
        }

        if (state is PostsError) {
          return Center(child: Text('مشكلة فى تحميل المنشورات'));
        }

        // هنا نضيف شرط لما تكون القائمة فاضية
        if (posts.isEmpty) {
          return Center(
            child: Text(
              S.of(context).noPostsExist,
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: _onRefresh,
          color: AppColors.primaryColor,
          child: NotificationListener<ScrollNotification>(
            onNotification: _onScrollNotification,
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: posts.length + 1,
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                if (index >= posts.length) {
                  return cubit.hasReachedEnd
                      ? const SizedBox(height: 0)
                      : const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: PostSkeleton(),
                      );
                }

                final post = posts[index];
                return CustomPost(
                  clickablePostImage: widget.clickablePostImage,
                  currentUser: widget.currentUser,
                  post: post,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
