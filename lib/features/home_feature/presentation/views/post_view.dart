import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/api/dio_consumer.dart';
import 'package:smile_simulation/core/widgets/bottom_navigation_bar/bottom_nvaigation_view.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/features/home_feature/data/repos/comments_repo/comments_repo_impl.dart';

import '../../data/models/post_model.dart';
import '../../data/repos/posts_repo/posts_repo_implement.dart';
import '../cubits/comments_cubit/comments_cubit.dart';
import '../cubits/post_details_cubit/post_details_cubit.dart';
import '../cubits/posts_cubit/posts_cubit.dart';
import 'widgets/posts/post_view_body.dart';

class PostView extends StatelessWidget {
  const PostView({super.key, required this.post});
  final PostModel post;
  final currentUser = false;
  static const String routeName = 'postView';
  @override
  Widget build(BuildContext context) {
    context.read<PostsCubit>().fetchPosts(isInitialLoad: true);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => PostDetailsCubit(
                postsRepo: PostsRepoImplement(
                  dioConsumer: DioConsumer(dio: Dio()),
                ),
                post: post,
              ),
        ),
        BlocProvider(
          create:
              (context) => CommentsCubit(
                relatedPost: post,
                commentsRepo: CommentsRepoImpl(
                  dioConsumer: DioConsumer(dio: Dio()),
                ),
              ),
        ),
      ],
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: customAppbar(
              context,
              isBack: true,
              goBack: () {
                if (context.read<PostDetailsCubit>().likePostDone ||
                    context.read<CommentsCubit>().commentAdded) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    BottomNavigationView.routeName,
                    (_) => false,
                  );
                } else {
                  Navigator.pop(context);
                }
              },
            ),
            body: PostViewBody(currentUser: currentUser),
          );
        },
      ),
    );
  }
}
