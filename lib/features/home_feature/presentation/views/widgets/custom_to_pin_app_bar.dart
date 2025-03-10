import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

class CustomToPinAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomToPinAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: kToolbarHeight,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(color: AppColors.primaryColor),
      child: Text('appbar', style: TextStyle(color: AppColors.whiteColor)),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
