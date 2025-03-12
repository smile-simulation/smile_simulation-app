// import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/widgets/current_user_circle_image.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/widgets/posts/other_user_cirle_image.dart';

class UserAccountHeader extends StatelessWidget {
  const UserAccountHeader({super.key, required this.currentUser});
  final bool currentUser;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 164 + kToolbarHeight + 40,
      child: Column(
        children: [
          SizedBox(height: kToolbarHeight + 40),
          SizedBox(
            height: 120,
            width: 120,
            child:
                currentUser
                    ? CurrentUserCircleImage(
                      color: AppColors.whiteColor,
                      borderWidth: 16,
                      onTap: () {
                        log("current user account image");
                      },
                    )
                    : OtherUserCircleImage(onTap: () {}),
          ),
          Text(
            "محمود مجدي",
            style: AppTextStyles.style20W700(
              context,
            ).copyWith(color: AppColors.whiteColor),
          ),
        ],
      ),
    );
  }
}
