import 'package:flutter/material.dart';
import 'package:smile_simulation/core/services/localization_helper.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/utils/app_translation.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/widgets/posts/create_post_view_body.dart';



class CreatePostView extends StatelessWidget {
  const CreatePostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title:  Text(
          '${LocalizationHelper.translate(TranslationKeys.createPost)}، ',
          overflow: TextOverflow.ellipsis,
        
          style: AppTextStyles.style20W700(context),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.whiteColor,
      ),
      body:
      CreatePostViewBody(),
    );
  }
}