import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';

class CommentBody extends StatelessWidget {
  const CommentBody({
    super.key,
    required this.userName,
    required this.comment,
    required this.date,
  });

  final String userName;
  final String comment;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(userName, style: AppTextStyles.style16W700(context)),
        SizedBox(height: 2),
        Text(comment, style: AppTextStyles.style16W400(context)),
        SizedBox(height: 2),
        Text(date, style: AppTextStyles.style10W400(context)),
      ],
    );
  }
}