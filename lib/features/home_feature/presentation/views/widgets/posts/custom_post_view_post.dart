import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/api/dio_consumer.dart';
import 'package:smile_simulation/core/helper_functions/format_date_time_ago.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/features/home_feature/data/models/post_model.dart';
import 'package:smile_simulation/features/home_feature/data/repos/posts_repo/posts_repo_implement.dart';
import 'package:smile_simulation/features/home_feature/presentation/cubits/post_details_cubit/post_details_cubit.dart';

import 'post_header.dart';
import 'post_vertical_layout.dart';

class PostViewPost extends StatelessWidget {
  const PostViewPost({
    super.key,
    required this.currentUser,
    this.clickablePostImage = true,
    required this.post,
  });

  final bool currentUser;
  final bool clickablePostImage;
  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => PostDetailsCubit(
            post: post,
            postsRepo: PostsRepoImplement(dioConsumer: DioConsumer(dio: Dio())),
          ),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.veryLightGreyColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PostHeader(
              userName: post.publisherName ?? "No Publisher Name",
              postDate: formatDateTimeAgo(rawDate: post.createdAt.toString()),
              currentUser: currentUser,
              clickablePostImage: clickablePostImage,
            ),
            const SizedBox(height: 4),
            PostVerticalLayout(post: post),
            const SizedBox(height: 12),
            // PostFooter(post: post),
          ],
        ),
      ),
    );
  }
}
