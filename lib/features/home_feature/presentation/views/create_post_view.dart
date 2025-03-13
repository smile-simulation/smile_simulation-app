import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/widgets/posts/create_post_view_body.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/widgets/posts/post_body.dart';
import 'package:smile_simulation/features/search_feature/presentation/views/widgets/search_view_body.dart';



class CreatePostView extends StatelessWidget {
  const CreatePostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          title: Text('انشاء منشور جديد', ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.whiteColor,
        ),
        body:
        CreatePostViewBody(),
      ),
    );
  }
}