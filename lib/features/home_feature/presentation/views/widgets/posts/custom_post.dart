import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/api/dio_consumer.dart';
import 'package:smile_simulation/features/home_feature/data/models/post_model.dart';
import 'package:smile_simulation/features/home_feature/data/repos/posts_repo/posts_repo_implement.dart';
import 'package:smile_simulation/features/home_feature/presentation/cubits/post_details_cubit/post_details_cubit.dart';

import 'post_footer.dart';
import 'post_header.dart';
import 'post_horizontal_layout.dart';

class CustomPost extends StatelessWidget {
  const CustomPost({
    super.key,
    required this.onTap,
    required this.currentUser,
    this.clickablePostImage = true,
    required this.post,
  });

  final Function() onTap;
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
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 244,
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PostHeader(
                userName: post.publisherName ?? "No Publisher Name",
                postDate: post.createdAt.toString(),
                currentUser: currentUser,
                clickablePostImage: clickablePostImage,
              ),
              const SizedBox(height: 4),
              PostHorizontalLayout(post: post),
              const SizedBox(height: 12),
              PostFooter(post: post),
            ],
          ),
        ),
      ),
    );
  }
}
