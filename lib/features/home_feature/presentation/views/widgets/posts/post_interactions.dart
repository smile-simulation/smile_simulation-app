// ✅ ويدجت لعرض عدد الإعجابات والتعليقات
import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/generated/l10n.dart';

class PostInteractions extends StatelessWidget {
  const PostInteractions({
    super.key,
    required this.likeCount,
    required this.commentCount,
  });
  final String likeCount;
  final String commentCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          '$likeCount ${S.of(context).likeCount}',
          style: AppTextStyles.caption2(context),
        ),
        const SizedBox(width: 8),
        Text(
          '$commentCount ${S.of(context).commentCount}',
          style: AppTextStyles.caption2(context),
        ),
      ],
    );
  }
}
