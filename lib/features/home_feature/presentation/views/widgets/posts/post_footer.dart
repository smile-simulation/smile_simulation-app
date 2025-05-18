import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/helper_functions/show_modal_bottom_sheet.dart';
import 'package:smile_simulation/core/widgets/bottom_navigation_bar/bottom_nvaigation_view.dart';
import 'package:smile_simulation/features/home_feature/presentation/cubits/comments_cubit/comments_cubit.dart';
import 'package:smile_simulation/generated/l10n.dart';

import '../../../../../../generated/assets.dart';
import '../../../../data/models/post_model.dart';
import '../../../cubits/post_details_cubit/post_details_cubit.dart';
import 'custom_comments_bottom_sheet.dart';
import 'post_footer_action_item.dart';

class PostFooter extends StatefulWidget {
  const PostFooter({super.key, required this.post, this.isPostView = false});
  final PostModel post;
  final bool isPostView;
  @override
  State<PostFooter> createState() => _PostFooterState();
}

class _PostFooterState extends State<PostFooter> {
  bool edited = false;
  @override
  Widget build(BuildContext context) {
    PostDetailsCubit cubit = context.read<PostDetailsCubit>();
    return SizedBox(
      height: 24,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          PostFooterActionItem(
            onTap: () async {
              await cubit.makeLike(postId: widget.post.id!);
            },
            actionText: S.of(context).like,
            icon: Assets.imagesLike,
            isActive: cubit.likedPost ?? widget.post.isLikedByCurrentUser!,
          ),

          SizedBox(height: 8),
          PostFooterActionItem(
            onTap: () {
              if (widget.isPostView) {
                FocusScope.of(context).requestFocus(
                  context.read<CommentsCubit>().CommentTextFieldCtrlFocusNode,
                );
              } else {
                customShowModalBottomSheet(
                  context: context,
                  builder:
                      (markEdited) => CustomCommentsBottomSheet(
                        post: widget.post,
                        markEdited: markEdited,
                      ),
                  oncomplete: (edited) async {
                    if (edited) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        BottomNavigationView.routeName,
                        (_) => false,
                      );
                    }
                  },
                );
              }
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
