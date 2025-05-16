import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

class UserImageSkeleton extends StatelessWidget {
  const UserImageSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(radius: 20, backgroundColor: AppColors.redColor);
  }
}
