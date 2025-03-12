import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

import 'widgets/posts/post_view_body.dart';

class PostView extends StatelessWidget {
  const PostView({super.key});
  final currentUser = false;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.whiteColor,
        ),
        body: PostViewBody(currentUser: currentUser),
      ),
    );
  }
}
