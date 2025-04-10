import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/features/home_feature/data/models/post_model.dart';
import 'package:smile_simulation/features/home_feature/presentation/cubits/comments_cubit/comments_cubit.dart';

import '../cubits/post_details_cubit/post_details_cubit.dart';
import 'widgets/posts/post_view_body.dart';

class PostView extends StatelessWidget {
  const PostView({super.key, required this.post});
  final PostModel post;
  final currentUser = false;
  static const String routeName = 'postView';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PostDetailsCubit(post)),
        BlocProvider(create: (context) => CommentsCubit(post)),
      ],
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
