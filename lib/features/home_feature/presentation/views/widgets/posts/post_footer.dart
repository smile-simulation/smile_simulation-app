import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/helper_functions/show_custom_snack_bar.dart';
import 'package:smile_simulation/core/helper_functions/show_modal_bottom_sheet.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/features/home_feature/presentation/cubits/post_details_cubit/post_details_cubit.dart';
import 'package:smile_simulation/generated/l10n.dart';

import '../../../../data/models/post_model.dart';
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
                icon: Icons.thumb_up,
                isActive: cubit.likedPost,
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
            icon: Icons.message_outlined,
            isActive: false,
          ),
        ],
      ),
    );
  }
}
