import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/generated/assets.dart';
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
    return Container(
      height: 70,
      child: BottomNavigationBar(
        selectedFontSize: 10,
        currentIndex: selectedIndex,
        onTap: onTap,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.greyColor,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 10,
        ),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            backgroundColor: AppColors.transparent,
            icon: SvgPicture.asset(
              Assets.imagesHome,
              color:
                  selectedIndex == 0
                      ? AppColors.primaryColor
                      : AppColors.greyColor,
            ),
            label: S.of(context).home,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.imagesDentalCare,
              color:
                  selectedIndex == 1
                      ? AppColors.primaryColor
                      : AppColors.greyColor,
            ),
            label: S.of(context).advices,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.imagesReminder,
              color:
                  selectedIndex == 2
                      ? AppColors.primaryColor
                      : AppColors.greyColor,
            ),
            label: S.of(context).reminders,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.imagesMedical,
              color:
                  selectedIndex == 3
                      ? AppColors.primaryColor
                      : AppColors.greyColor,
            ),
            label: S.of(context).medicalRecord,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.imagesMore,
              color:
                  selectedIndex == 4
                      ? AppColors.primaryColor
                      : AppColors.greyColor,
            ),
            label: S.of(context).more,
          ),
        ],
      ),
    );
  }
}
