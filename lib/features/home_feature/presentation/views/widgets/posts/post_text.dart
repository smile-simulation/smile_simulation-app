

// ✅ ويدجت لعرض نص البوست
import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';

class PostText extends StatelessWidget {
  const PostText({super.key, required this.postContent, this.maxLines});
  final String postContent;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: SingleChildScrollView(
          child: Text(
            postContent,
            textAlign: TextAlign.justify,
            maxLines: maxLines,
            overflow:
                maxLines != null ? TextOverflow.ellipsis : TextOverflow.visible,
            style: AppTextStyles.button2(context).copyWith(height: 1.5),
          ),
        ),
      ),
    );
  }
}
