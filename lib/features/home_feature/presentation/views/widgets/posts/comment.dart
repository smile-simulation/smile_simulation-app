import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smile_simulation/core/helper_functions/format_date_time_ago.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/features/home_feature/data/models/comment_model.dart';

import '../../../../../../generated/assets.dart';
import 'comment_body.dart';

class Comment extends StatelessWidget {
  const Comment({super.key, required this.comment});
  final CommentModel comment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.veryLightGreyColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 64,
            height: 64,
            child: CircleAvatar(
              backgroundImage:
                  comment.publisherImage != null
                      ? CachedNetworkImageProvider(comment.publisherImage!)
                      : AssetImage(Assets.imagesUser),
              radius: 20,
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: CommentBody(
              userName: comment.publisherName ?? "لا يوجد اسم ناشر",
              comment: comment.content ?? "لا يوجد محتوي",
              date: formatDateTimeAgo(rawDate: comment.createdAt.toString()),
            ),
          ),
        ],
      ),
    );
  }
}
