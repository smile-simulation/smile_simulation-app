import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

import '../../../cubits/post_details_cubit/post_details_cubit.dart';
import 'post_header.dart';
import 'post_vertical_layout.dart';

class PostViewPost extends StatelessWidget {
  const PostViewPost({
    super.key,
    required this.currentUser,
    this.clickablePostImage = true,
  });

  final bool currentUser;
  final bool clickablePostImage;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            currentUser: currentUser,
            clickablePostImage: clickablePostImage,
            post: context.read<PostDetailsCubit>().post,
          ),
          const SizedBox(height: 4),
          PostVerticalLayout(),
          const SizedBox(height: 12),
          // PostFooter(post: post),
        ],
      ),
    );
  }
}
