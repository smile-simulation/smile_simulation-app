import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

import 'bottom_nav_pointer.dart';
import 'custom_bottom_navigation_bar_items.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.onTap,
    required this.selectedIndex,
  });

  final Function(int) onTap;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      width: double.infinity,

      decoration: BoxDecoration(color: AppColors.whiteColor),
      child: Stack(
        children: [
          CustomBottomNavBarItems(selectedIndex: selectedIndex, onTap: onTap),
          BottomNavPointer(selectedIndex: selectedIndex),
        ],
      ),
    );
  }
}
