import 'package:flutter/material.dart';
import 'package:smile_simulation/constant.dart';
import 'package:smile_simulation/core/api/api_keys.dart' show ApiKeys;
import 'package:smile_simulation/core/database/cache/cache_helper.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/bottom_navigation_bar/bottom_nvaigation_view.dart';
import 'package:smile_simulation/features/auth/login/presentation/view/login_view.dart';
import 'package:smile_simulation/generated/l10n.dart';

class MoreViewBody extends StatelessWidget {
  const MoreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            style: TextButton.styleFrom(backgroundColor: AppColors.whiteColor),
            onPressed: () {
              CacheHelper().removeData(key: ApiKeys.token);
              Navigator.pushReplacementNamed(context, LoginView.routeName);
            },
            child: Text(
              S.of(context).logOut,
              style: AppTextStyles.button2(
                context,
              ).copyWith(color: AppColors.primaryColor),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(backgroundColor: AppColors.whiteColor),
            onPressed: () {},
            child: Text(
              S.of(context).changeLanguage,
              style: AppTextStyles.button2(
                context,
              ).copyWith(color: AppColors.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
