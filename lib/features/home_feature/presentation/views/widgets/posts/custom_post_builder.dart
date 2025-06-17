import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/features/user_account/presentation/managers/get_user_posts_cubit/get_user_posts_cubit.dart';

import '../../../../data/models/post_model.dart';
import '../../../cubits/post_details_cubit/post_details_cubit.dart';
import '../../post_view.dart';
import 'post_footer.dart';
import 'post_header.dart';
import 'post_horizontal_layout.dart';

class CustomPostBuilder extends StatelessWidget {
  const CustomPostBuilder({
    super.key,
    required this.currentUser,
    required this.clickablePostImage,
    this.getUserPostsCubit,
  });

  final bool currentUser;
  final bool clickablePostImage;

  final GetUserPostsCubit? getUserPostsCubit;

  @override
  Widget build(BuildContext context) {
    PostDetailsCubit cubit = context.read<PostDetailsCubit>();
    return BlocConsumer<PostDetailsCubit, PostDetailsState>(
      listener: (BuildContext context, PostDetailsState state) {},

      builder: (context, state) {
        PostModel post = cubit.post;
        return InkWell(
          onTap: () {
            if (!currentUser) {
              Navigator.pushNamed(context, PostView.routeName, arguments: post);
            }
          },
          child: Card(
            child: Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.whiteColorForCard,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PostHeader(
                    currentUser: currentUser,
                    clickablePostImage: clickablePostImage,
                    post: context.read<PostDetailsCubit>().post,
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
      },
    );
  }
}
