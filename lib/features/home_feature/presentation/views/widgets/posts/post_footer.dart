import 'package:flutter/material.dart';
import 'package:smile_simulation/core/helper_functions/show_modal_bottom_sheet.dart';
import 'package:smile_simulation/generated/l10n.dart';

import 'custom_comments_bottom_sheet.dart';
import 'post_footer_action_item.dart';

class PostFooter extends StatelessWidget {
  const PostFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
            customShowModalBottomSheet(
              context: context,
              child: CustomCommentsBottomSheet(),
            );
          },
          actionText: S.of(context).comment,
          icon: Icons.message_outlined,
          isActive: false,
        ),
      ],
    );
  }
}
