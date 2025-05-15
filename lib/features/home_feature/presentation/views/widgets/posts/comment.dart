import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

import '../../../../../../constant.dart';
import '../../../../../../core/database/cache/cache_helper.dart';
import '../../../../../../generated/assets.dart';
import '../../../../../user_account/presentation/views/user_account_view.dart';
import 'comment_body.dart';

class Comment extends StatelessWidget {
  const Comment({
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
            child:CircleAvatar(
              backgroundImage:
              CacheHelper().getMap(key: userData)!['image'] != null
                  ? NetworkImage(CacheHelper().getMap(key: userData)!['image'])
                  : const AssetImage(Assets.imagesUser),
              radius: 20,
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: CommentBody(
              userName: userName,
              comment: comment,
              date: date,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Icon(
              Icons.thumb_up_alt_outlined,
              color: AppColors.greyColor,
            ),
          ),
        ],
      ),
    );
  }
}
