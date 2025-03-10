import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

import 'post_body.dart';
import 'post_footer.dart';
import 'post_header.dart';

class CustomPost extends StatelessWidget {
  const CustomPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 178,
      padding: EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.veryLightGreyColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(children: [PostHeader(), PostBody(), PostFooter()]),
    );
  }
}
