import 'package:flutter/material.dart';
import 'package:smile_simulation/generated/assets.dart';

class BottomNavPointer extends StatelessWidget {
  const BottomNavPointer({super.key, required this.selectedIndex});

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double itemWidth = screenWidth / 5;

    bool isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300), // مدة الأنيميشن
      curve: Curves.easeInOut, // شكل الحركة
      bottom: 4,
      left: isArabic ? null : 8 + itemWidth * selectedIndex,
      right: isArabic ? 8 + itemWidth * selectedIndex : null,
      child: Align(
        alignment:
            isArabic
                ? AlignmentDirectional.bottomEnd
                : AlignmentDirectional.bottomCenter,
        child: SizedBox(
          height: 8,
          child: Image.asset(
            Assets.imagesBottomNavBarPointer,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
