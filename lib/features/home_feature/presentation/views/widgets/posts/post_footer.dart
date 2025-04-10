import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:smile_simulation/core/helper_functions/show_modal_bottom_sheet.dart';
import 'package:smile_simulation/generated/l10n.dart';

import '../../../../data/models/post_model.dart';
import 'custom_comments_bottom_sheet.dart';
import 'post_footer_action_item.dart';

class PostFooter extends StatelessWidget {
  const PostFooter({super.key, required this.isPostView, required this.post});
  final bool isPostView;
  final PostModel post;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          PostFooterActionItem(
            onTap: () {},
            actionText: S.of(context).like,
            icon: Icons.thumb_up,
            isActive: true,
          ),
          SizedBox(height: 8),
          PostFooterActionItem(
            onTap: () {
              if (isPostView) {
                log('page view');
                // context
                //     .read<PostDetailsCubit>()
                //     .unitCodeCtrlFocusNode
                //     .requestFocus();
              } else {
                customShowModalBottomSheet(
                  context: context,
                  child: CustomCommentsBottomSheet(post: post),
                );
              }
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
