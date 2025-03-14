import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/generated/l10n.dart';

class CustomBottomNavBarItems extends StatelessWidget {
  const CustomBottomNavBarItems({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  final int selectedIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: BottomNavigationBar(
        selectedFontSize: 8,
        currentIndex: selectedIndex,
        onTap: onTap,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.greyColor,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 12,
        ),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            backgroundColor: AppColors.transparent,
            icon: const Icon(Icons.home),
            label: S.of(context).home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.lightbulb),
            label: S.of(context).advices,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.notifications),
            label: S.of(context).reminders,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.medical_services),
            label: S.of(context).medicalRecord,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.more_horiz),
            label: S.of(context).more,
          ),
        ],
      ),
    );
  }
}
