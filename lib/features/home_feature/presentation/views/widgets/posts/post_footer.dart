import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/helper_functions/show_modal_bottom_sheet.dart';
import 'package:smile_simulation/generated/l10n.dart';

import '../../../../../../generated/assets.dart';
import '../../../../data/models/post_model.dart';
import '../../../cubits/post_details_cubit/post_details_cubit.dart';
import 'custom_comments_bottom_sheet.dart';
import 'post_footer_action_item.dart';

class PostFooter extends StatelessWidget {
  const PostFooter({super.key, required this.post});
  final PostModel post;
  @override
  Widget build(BuildContext context) {
    PostDetailsCubit cubit = context.read<PostDetailsCubit>();
    return SizedBox(
      height: 24,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BlocBuilder<PostDetailsCubit, PostDetailsState>(
            builder: (context, state) {
              return PostFooterActionItem(
                onTap: () async {
                  await cubit.makeLike(postId: post.id!);
                },
                actionText: S.of(context).like,
                icon: Assets.imagesLike,
                isActive: cubit.likedPost ?? post.isLikedByCurrentUser!,
              );
            },
          ),
          SizedBox(height: 8),
          PostFooterActionItem(
            onTap: () {
              customShowModalBottomSheet(
                context: context,
                child: CustomCommentsBottomSheet(post: post),
              );
            },
            actionText: S.of(context).comment,
            icon: Assets.imagesComment,
            isActive: false,
          ),
        ],
      ),
    );
  }
}
