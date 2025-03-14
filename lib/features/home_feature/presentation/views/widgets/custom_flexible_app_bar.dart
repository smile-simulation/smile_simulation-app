import 'package:flutter/material.dart';
import 'package:smile_simulation/core/services/navigations.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/widgets/current_user_circle_image.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/widgets/flexible_app_bar_icons_section.dart';
import 'package:smile_simulation/features/user_account/presentation/views/user_account_view.dart';
import 'package:smile_simulation/generated/l10n.dart';

import 'custom_to_pin_app_bar.dart';

class CustomFlexibleAppBar extends StatelessWidget {
  const CustomFlexibleAppBar({super.key});
  final String name = 'محمود مجدي';
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
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return UserAccountView(currentUser: true);
              //     },
              //   ),
              // );
              navigateTo(context, UserAccountView(currentUser: true));
            },
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              '${S.of(context).welcomeMsg}، $name!',
              overflow: TextOverflow.ellipsis,

              style: AppTextStyles.style20W700(context),
            ),
          ),
          FlexibleAppBarIconsSection(),
        ],
      ),
    );
  }
}
