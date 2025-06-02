import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/features/home_feature/data/models/post_model.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/widgets/posts/edit_post_view_body.dart';
import 'package:smile_simulation/generated/l10n.dart';

class EditPostView extends StatelessWidget {
  const EditPostView({super.key, required this.post});
  final PostModel post;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: Expanded(
          child: Text(
            '${S.of(context).editPost}، ',
            overflow: TextOverflow.ellipsis,

            style: AppTextStyles.headline2(context),
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.whiteColor,
      ),
      body: EditPostViewBody(post: post,),
    );
  }
}
