import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

import 'widgets/user_account_view_body.dart';

class UserAccountView extends StatelessWidget {
  const UserAccountView({super.key, required this.currentUser});
  static const String routeName = 'user_account_view';
  final bool currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.whiteColor,
        shadowColor: AppColors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.primaryColor,
      body: UserAccountViewBody(currentUser: currentUser),
    );
  }
}
