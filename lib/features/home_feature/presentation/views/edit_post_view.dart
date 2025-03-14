import 'package:flutter/material.dart';
import 'package:smile_simulation/core/services/localization_helper.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/utils/app_translation.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/widgets/posts/edit_post_view_body.dart';

import 'widgets/posts/post_view_body.dart';

class EditPostView extends StatelessWidget {
  const EditPostView({super.key});
  final currentUser = false;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar:   AppBar(
          title:  Expanded(
            child: Text(
              '${LocalizationHelper.translate(TranslationKeys.editPost)}، ',
              overflow: TextOverflow.ellipsis,

              style: AppTextStyles.style20W700(context),
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.whiteColor,
        ),
        body: EditPostViewBody(),
      ),
    );
  }
}
