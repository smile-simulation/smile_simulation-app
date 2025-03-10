import 'package:flutter/material.dart';
import 'package:smile_simulation/core/services/localization_helper.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/widgets/currentUserCircleIcon.dart';

import 'custom_to_pin_app_bar.dart';

class CustomFlexibleAppBar extends StatelessWidget {
  const CustomFlexibleAppBar({super.key});
  final String name = 'محمد فوزي';
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 124,
      elevation: 0,
      centerTitle: true,
      floating: true,
      pinned: true,
      bottom: CustomToPinAppBar(),
      backgroundColor: AppColors.primaryColor,

      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Currentusercircleicon(radius: 20),
          SizedBox(width: 12),
          Text(
            '${LocalizationHelper.translate('welcomeMsg')}، $name!',
            style: TextStyle(color: AppColors.whiteColor),
          ),
        ],
      ),
    );
  }
}
