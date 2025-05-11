import 'dart:convert';
import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:smile_simulation/core/services/gradio_service.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/generated/l10n.dart';

import 'posts_list_view.dart';

class HomeViewBodyContent extends StatelessWidget {
  const HomeViewBodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16, left: 16, right: 16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(45),
          topRight: Radius.circular(45),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                S.of(context).posts,
                style: AppTextStyles.headline2(
                  context,
                ).copyWith(color: AppColors.blackColor),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: AppColors.whiteColor,
                ),
                onPressed: () {
                  GradioService().sendMessageToGradio("حل مشاكل الاسنان");
                },
                child: Text("اختبار"),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: AppColors.whiteColor,
                ),
                onPressed: () async {},
                child: Text("الاختبار 2"),
              ),
            ],
          ),
          Expanded(child: PostsListView(currentUser: false)),
        ],
      ),
    );
  }
}
