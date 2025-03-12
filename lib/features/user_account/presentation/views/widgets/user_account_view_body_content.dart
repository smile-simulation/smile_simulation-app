import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

import 'user_account_title.dart';
import 'user_details_section.dart';

class UserAccountViewBodyContent extends StatelessWidget {
  const UserAccountViewBodyContent({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(45),
          topRight: Radius.circular(45),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserAccountTitle(),
          SizedBox(height: 16),
          UserDetailsSection(),
        ],
      ),
    );
  }
}
