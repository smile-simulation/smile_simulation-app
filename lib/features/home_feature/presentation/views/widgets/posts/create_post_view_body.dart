import 'package:flutter/material.dart';
import 'package:smile_simulation/core/helper_functions/custom_body_screen.dart';
import 'package:smile_simulation/core/services/localization_helper.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/utils/app_translation.dart';
import 'package:smile_simulation/core/utils/widgets/custom_button.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/widgets/current_user_circle_image.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/widgets/flexible_app_bar_icons_section.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/widgets/posts/other_user_cirle_image.dart';
import 'package:smile_simulation/features/user_account/presentation/views/user_account_view.dart';

class CreatePostViewBody extends StatelessWidget {
  const CreatePostViewBody({super.key});

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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return UserAccountView(currentUser: true);
                      },
                    ),
                  );
                },
              ),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  LocalizationHelper.translate(TranslationKeys.mohamedHamed),
                  overflow: TextOverflow.ellipsis,

                  style: AppTextStyles.style20W700(
                    context,
                  ).copyWith(color: AppColors.blackColor),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.image, color: AppColors.primaryColor),
                    ),
                    hintText: LocalizationHelper.translate(
                      TranslationKeys.postContent,
                    ),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.transparent),),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryColor,
                        width: 2.0,
                      ), // Border color when focused
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white.withValues()),
                      
                    ),
                  ),
                ),
              ),
            ],
          ),

          Spacer(),
          CustomButton(
            text: 'نشر',
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
