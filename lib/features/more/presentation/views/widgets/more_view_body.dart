import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/generated/assets.dart';

import 'more_action_item_list_tile.dart';

class MoreViewBody extends StatelessWidget {
  const MoreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, title: "المزيد", isBack: false),
      body: CustomBodyScreen(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "المزيد من الاعدادات",
                style: AppTextStyles.headline2(
                  context,
                ).copyWith(color: AppColors.greyColor),
              ),
            ),
            SizedBox(height: 16),
            MoreActionItemListTile(
              iconPath: Assets.imagesUserAccountIcon,
              title: "الملف الشخصي",
              onTap: () {},
            ),
            MoreActionItemListTile(
              iconPath: Assets.imagesSettingsIcon,
              title: "الإعدادات",
              onTap: () {},
            ),
            MoreActionItemListTile(
              iconPath: Assets.imagesPrivacyPolicyIcon,
              title: "سياسة الخصوصية",
              onTap: () {},
            ),
            MoreActionItemListTile(
              iconPath: Assets.imagesRateAppIcon,
              title: "تقييم التطبيق",
              onTap: () {},
            ),
            MoreActionItemListTile(
              iconPath: Assets.imagesShareIcon,
              title: "مشاركة التطبيق",
              onTap: () {},
            ),
            MoreActionItemListTile(
              iconPath: Assets.imagesContactUsIcon,
              title: "تواصل معنا",
              onTap: () {},
            ),
            MoreActionItemListTile(
              iconPath: Assets.imagesLogoutIcon,
              title: "تسجيل الخروج",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
