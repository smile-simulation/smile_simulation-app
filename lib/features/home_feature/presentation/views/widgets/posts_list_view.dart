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
  final ScrollController _scrollController = ScrollController();
  bool isLoadingMore = false;
  bool isCheckingNewPosts = false;

  @override
  void initState() {
    super.initState();
    context.read<PostsCubit>().fetchPosts(isInitialLoad: true);

    _scrollController.addListener(() {
      final cubit = context.read<PostsCubit>();
      final position = _scrollController.position;

      // 👇 تحميل المزيد وانت نازل
      if (position.pixels >= position.maxScrollExtent - 200 &&
          !isLoadingMore &&
          !cubit.hasReachedEnd) {
        isLoadingMore = true;
        cubit.fetchPosts().then((_) {
          isLoadingMore = false;
        });
      }

      // 👆 التحقق من بوستات أحدث وانت طالع
      if (position.pixels <= 50 && !isCheckingNewPosts) {
        isCheckingNewPosts = true;
        cubit.fetchNewPosts().then((_) {
          isCheckingNewPosts = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() async {
    await context.read<PostsCubit>().refreshPosts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsCubit, PostsState>(
      builder: (context, state) {
        final cubit = context.read<PostsCubit>();
        final posts = cubit.posts;

        if (state is PostsInitial || state is PostsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is PostsError) {
          return const Center(child: Text("خطأ في تحميل المنشورات"));
        }

        return RefreshIndicator(
          onRefresh: _onRefresh,
          color: AppColors.primaryColor,
          child: ListView.separated(
            padding: EdgeInsets.zero,
            controller: _scrollController,
            itemCount: posts.length + 1,
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              if (index >= posts.length) {
                return cubit.hasReachedEnd
                    ? const SizedBox(height: 0)
                    : const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Center(child: CircularProgressIndicator()),
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
        );
      },
    );
  }
}
