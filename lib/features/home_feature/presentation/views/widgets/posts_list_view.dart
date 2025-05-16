import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/bottom_navigation_bar/bottom_nvaigation_view.dart';
import '../../cubits/posts_cubit/posts_cubit.dart';
import 'posts/custom_post.dart';

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

  void _onScroll(ScrollNotification notification) {
    if (notification.metrics.pixels >=
        notification.metrics.maxScrollExtent - 200) {
      if (!isLoadingMore) {
        isLoadingMore = true;
        context.read<PostsCubit>().fetchPosts().then((_) {
          isLoadingMore = false;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<PostsCubit>().fetchPosts(isInitialLoad: true);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsCubit, PostsState>(
      builder: (context, state) {
        log(state.toString());
        final cubit = context.read<PostsCubit>();
        final posts = cubit.posts;
        if (cubit.newLikeStatus == true) {
          context.read<PostsCubit>().fetchPosts(isInitialLoad: true);
          cubit.newLikeStatus = false;
        }
        if (state is PostsInitial) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is PostsError) {
          return const Center(child: Text("خطأ في تحميل المنشورات"));
        }

        return RefreshIndicator(
          displacement: 100,
          edgeOffset: 0,
          color: AppColors.primaryColor,

          onRefresh: () async {
            await Navigator.pushNamedAndRemoveUntil(
              context,
              BottomNavigationView.routeName,
              (_) => false,
            );
          },
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              _onScroll(notification);
              return false;
            },
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: cubit.hasReachedEnd ? posts.length : posts.length + 1,
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                if (index >= posts.length) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: CircularProgressIndicator(),
                    ),
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
