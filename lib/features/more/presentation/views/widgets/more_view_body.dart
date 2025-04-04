import 'package:flutter/material.dart';
import 'package:smile_simulation/core/api/api_keys.dart' show ApiKeys;
import 'package:smile_simulation/core/database/cache/cache_helper.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/features/auth/login/presentation/view/login_view.dart';

class MoreViewBody extends StatelessWidget {
  const MoreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: AppColors.whiteColor),
        onPressed: () {
          CacheHelper().removeData(key: ApiKeys.token);
          Navigator.pushReplacementNamed(context, LoginView.routeName);
        },
        child: Text(
          "Losgout",
          style: AppTextStyles.button2(
            context,
          ).copyWith(color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
