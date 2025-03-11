import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

class Comment extends StatelessWidget {
  const Comment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.veryLightGreyColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(children: []),
    );
  }
}
