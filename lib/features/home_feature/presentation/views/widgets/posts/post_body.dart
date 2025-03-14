import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/generated/l10n.dart';

import 'custom_post_image.dart';

class PostBody extends StatelessWidget {
  const PostBody({super.key});
  final String postContent =
      'نصيحة للعناية اليومية بالأسنان:\n'
      'اغسل أسنانك مرتين يوميًا على الأقل باستخدام معجون يحتوي على الفلورايد، ولا تنسَ تنظيف اللسان.';
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                postContent,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                softWrap: true,
                style: AppTextStyles.style12W700(context),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomPostImgae(),
              SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '425 ${S.of(context).likeCount}',
                    style: AppTextStyles.style10W400(context),
                  ),
                  SizedBox(width: 8),
                  Text(
                    '56 ${S.of(context).commentCount}',
                    style: AppTextStyles.style10W400(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
