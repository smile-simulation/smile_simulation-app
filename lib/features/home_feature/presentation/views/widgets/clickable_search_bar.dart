import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/create_post_view.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/widgets/current_user_circle_image.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/widgets/custom_icon.dart';
import 'package:smile_simulation/generated/l10n.dart';

class ClickableSearchBar extends StatelessWidget {
  ClickableSearchBar({super.key});
  final Function(BuildContext) onTap = (context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => CreatePostView()));
  };

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(context);
      },
      child: Container(
        // height: ,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Row(
          children: [
            CurrentUserCircleImage(
              color: AppColors.primaryColor,
              borderWidth: 6,
              onTap: () {
                onTap(context);
              },
            ),
            SizedBox(width: 4),
            Expanded(
              child: Container(
                height: 36,
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: AppColors.veryLightGreyColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: [
                    Text(
                      S.of(context).createPost,
                      style: AppTextStyles.style14W400(
                        context,
                      ).copyWith(color: AppColors.greyColor),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10),
            CustomIcon(
              icon: Icons.image,
              color: AppColors.primaryColor,
              onTap: () {
                onTap(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
