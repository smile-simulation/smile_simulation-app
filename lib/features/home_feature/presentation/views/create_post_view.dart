import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/helper_functions/get_it.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/features/home_feature/data/repos/posts_repo/posts_repo_implement.dart';
import 'package:smile_simulation/features/home_feature/presentation/cubits/add_post_cubit/add_post_cubit.dart';
import 'package:smile_simulation/generated/l10n.dart';

import 'widgets/posts/create_post_view_body.dart';

class CreatePostView extends StatelessWidget {
  const CreatePostView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddPostCubit(getIt.get<PostsRepoImplement>()),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          title: Text(
            '${S.of(context).createPost}، ',
            overflow: TextOverflow.ellipsis,

            style: AppTextStyles.headline2(context),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.whiteColor,
        ),
        body: CreatePostViewBody(),
      ),
    );
  }
}
