import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/api/dio_consumer.dart';
import 'package:smile_simulation/features/home_feature/data/models/post_model.dart';
import 'package:smile_simulation/features/home_feature/data/repos/posts_repo/posts_repo_implement.dart';
import 'package:smile_simulation/features/home_feature/presentation/cubits/post_details_cubit/post_details_cubit.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/widgets/posts/widgets_skeletons/post_skeleton.dart';

import 'custom_post_builder.dart';

class CustomPost extends StatelessWidget {
  const CustomPost({
    super.key,
    required this.currentUser,
    this.clickablePostImage = true,
    required this.post,
    required this.postIndex,
  });

  final bool currentUser;
  final bool clickablePostImage;
  final PostModel post;
  final int postIndex;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => PostDetailsCubit(
            post: post,
            postsRepo: PostsRepoImplement(dioConsumer: DioConsumer(dio: Dio())),
          ),
      child:
      // PostSkeleton(),
      CustomPostBuilder(
        currentUser: currentUser,
        clickablePostImage: clickablePostImage,
      ),
    );
  }
}
