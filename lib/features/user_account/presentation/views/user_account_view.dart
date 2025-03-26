import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/features/user_account/presentation/views/widgets/user_account_view_body.dart';

class UserAccountView extends StatelessWidget {
  const UserAccountView({super.key, required this.currentUser});
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
