import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/features/home_feature/data/models/post_model.dart';

import '../cubits/post_details_cubit/post_details_cubit.dart';
import 'widgets/posts/post_view_body.dart';

class PostView extends StatelessWidget {
  const PostView({super.key, required this.post});
  final PostModel post;
  final currentUser = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostDetailsCubit(post),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.whiteColor,
        ),
        body: PostViewBody(currentUser: currentUser),
      ),
    );
  }
}
