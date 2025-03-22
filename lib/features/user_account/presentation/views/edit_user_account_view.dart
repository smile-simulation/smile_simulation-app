import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/features/user_account/presentation/views/widgets/edit_user_account_view_body.dart';

class EditUserAccountView extends StatelessWidget {
  const EditUserAccountView({super.key});

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
      body: const EditUserAccountViewBody(),
    );
  }
}
