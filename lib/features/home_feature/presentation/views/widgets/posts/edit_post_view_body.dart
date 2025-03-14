import 'package:flutter/material.dart';
import 'package:smile_simulation/core/helper_functions/custom_body_screen.dart';
import 'package:smile_simulation/core/services/navigations.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/utils/widgets/custom_button.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/widgets/current_user_circle_image.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/widgets/posts/post_body.dart';
import 'package:smile_simulation/features/user_account/presentation/views/user_account_view.dart';
import 'package:smile_simulation/generated/l10n.dart';

class EditPostViewBody extends StatelessWidget {
  const EditPostViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBodyScreen(
      child: Column(
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CurrentUserCircleImage(
                color: AppColors.primaryColor,
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
                  S.of(context).mohamedHamed,
                  overflow: TextOverflow.ellipsis,

                  style: AppTextStyles.heading2(context).copyWith(color: AppColors.blackColor),
                ),
              ),
              SizedBox(width: 50),
              Icon(Icons.image, color: AppColors.primaryColor),
            ],
          ),
          SizedBox(height: 30),
          PostBody(),

          Spacer(),
          CustomButton(
            text: S.of(context).editPost,
            buttonColor: AppColors.primaryColor,
            textColor: AppColors.whiteColor,
            onPressed: () {},
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
