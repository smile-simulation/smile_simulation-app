import 'package:flutter/material.dart';
import 'package:smile_simulation/core/services/localization_helper.dart';
import 'package:smile_simulation/core/utils/app_assets.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_translation.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.onTap,
    required this.selectedIndex,
  });
  final Function(int) onTap;
  final int selectedIndex;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  void _onItemTapped(int index) {
    setState(() {
      widget.onTap(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double itemWidth = screenWidth / 5;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2), // ظل خفيف للأعلى
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            right:
                widget.selectedIndex * itemWidth +
                (itemWidth / 2) -
                30, // ضبط مكان المؤشر
            bottom: 15,
            child: Image.asset(AppAssets.bottomNavBarPointer),
          ),
          BottomNavigationBar(
            currentIndex: widget.selectedIndex,
            onTap: _onItemTapped,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
            ),
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent, // جعل الخلفية شفافة
            elevation: 0, // منع أي ظل إضافي
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: LocalizationHelper.translate(TranslationKeys.home),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.lightbulb),
                label: LocalizationHelper.translate(TranslationKeys.advices),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.notifications),
                label: LocalizationHelper.translate(TranslationKeys.reminders),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.medical_services),
                label: LocalizationHelper.translate(
                  TranslationKeys.medicalRecord,
                ),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.more_horiz),
                label: LocalizationHelper.translate(TranslationKeys.more),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
