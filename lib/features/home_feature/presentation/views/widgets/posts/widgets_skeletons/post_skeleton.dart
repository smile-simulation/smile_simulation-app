import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

import 'custom_post_body_skeleton.dart';
import 'custom_post_footer_skeleton.dart';
import 'custom_post_interactions_skeleton.dart';
import 'post_header_skeleton.dart';

class PostSkeleton extends StatelessWidget {
  const PostSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 255,
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PostHeaderSkeleton(),
            SizedBox(height: 8),
            Expanded(child: CustomPostBodySkeleton()),
            SizedBox(height: 8),
            CustomPostInteractionsSkeleton(),
            SizedBox(height: 8),
            CustomPostFooterSkeleton(),
          ],
        ),
      ),
    );
  }
}
