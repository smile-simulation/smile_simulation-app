import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

import 'custom_post_body_skeleton.dart';
import 'custom_post_footer_skeleton.dart';
import '../custom_post_interactions_skeleton.dart';
import 'post_header_skeleton.dart';

class PostSkeleton extends StatelessWidget {
  const PostSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 220,
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PostHeaderSkeleton(), // 260
            SizedBox(height: 8),
            SizedBox(height: 70, child: CustomPostBodySkeleton()),
            SizedBox(height: 8),
            SizedBox(height: 16, child: CustomPostInteractionsSkeleton()),
            SizedBox(height: 8),
            SizedBox(height: 32, child: CustomPostFooterSkeleton()),
          ],
        ),
      ),
    );
  }
}
