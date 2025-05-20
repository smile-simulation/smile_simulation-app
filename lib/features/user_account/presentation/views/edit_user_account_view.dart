import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

class EditUserAccountView extends StatelessWidget {
  const EditUserAccountView({super.key});
  static const routeName = "editUserAccountView";
  
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
      // body: const EditUserAc.countViewBody(),
    );
  }
}
