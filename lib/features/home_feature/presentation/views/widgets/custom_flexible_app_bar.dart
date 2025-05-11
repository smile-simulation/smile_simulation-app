import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/generated/l10n.dart';

import '../../../../../core/database/cache/cache_helper.dart';
import '../../../../user_account/presentation/views/user_account_view.dart';
import 'current_user_circle_image.dart';
import 'custom_to_pin_app_bar.dart';
import 'flexible_app_bar_icons_section.dart';

class CustomFlexibleAppBar extends StatelessWidget {
   CustomFlexibleAppBar({super.key});
  final String name =CacheHelper().getMap(key: 'userData')!['fullName']?? '';
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 164,
      elevation: 0,
      centerTitle: true,
      floating: true,
      pinned: true,
      bottom: CustomToPinAppBar(),
      backgroundColor: AppColors.primaryColor,

      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CurrentUserCircleImage(
            color: AppColors.whiteColor,
            borderWidth: 8,
            onTap: () {
              Navigator.pushNamed(
                context,
                UserAccountView.routeName,
                arguments: true,
              );
            },
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              '${S.of(context).welcomeMsg}، $name!',
              overflow: TextOverflow.ellipsis,

              style: AppTextStyles.headline2(
                context,
              ).copyWith(color: AppColors.whiteColor),
            ),
          ),
          FlexibleAppBarIconsSection(),
        ],
      ),
    );
  }
}
