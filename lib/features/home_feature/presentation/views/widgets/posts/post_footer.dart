import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_translation.dart';

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
          actionText: TranslationKeys.like,
          icon: Icons.thumb_up,
          isActive: true,
        ),
        SizedBox(height: 8),
        PostFooterActionItem(
          onTap: () {},
          actionText: TranslationKeys.comment,
          icon: Icons.message_outlined,
          isActive: false,
        ),
      ],
    );
  }
}
