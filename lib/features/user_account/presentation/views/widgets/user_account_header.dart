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
      height: 164 + kToolbarHeight + 32,
      child: Column(
        children: [
          SizedBox(height: kToolbarHeight + 32),
          SizedBox(
            height: 120,
            width: 120,
            child:
                currentUser
                    ? CurrentUserCircleImage(
                      color: AppColors.primaryColor,
                      borderWidth: 16,
                      onTap: () {},
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
