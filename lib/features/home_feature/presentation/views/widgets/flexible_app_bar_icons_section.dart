import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/widgets/custom_icon.dart';

class FlexibleAppBarIconsSection extends StatelessWidget {
  const FlexibleAppBarIconsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min, // ✅ تقليل الحجم للحد الأدنى
      children: [
        CustomIcon(
          icon: Icons.favorite_border_outlined,
          color: AppColors.whiteColor, // ✅ تحديد اللون
          onTap: () {
            // أكشن الأيقونة الأولى
          },
        ),
        SizedBox(width: 8),
        CustomIcon(
          icon: Icons.chat,
          color: AppColors.whiteColor,
          onTap: () {
            // أكشن الأيقونة الثانية
          },
        ),
        SizedBox(width: 8),
        CustomIcon(
          icon: Icons.notifications,
          color: AppColors.whiteColor,
          onTap: () {
            // أكشن الأيقونة الثالثة
          },
        ),
      ],
    );
  }
}
