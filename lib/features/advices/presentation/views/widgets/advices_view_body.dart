import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_app_bar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/generated/assets.dart';
import 'package:smile_simulation/generated/l10n.dart';

class AdvicesViewBody extends StatelessWidget {
  const AdvicesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(title: 'النصائح'),
        Expanded(
          child: CustomBodyScreen(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Text(
                    S.of(context).posts,
                    style: AppTextStyles.headline2(
                      context,
                    ).copyWith(color: AppColors.blackColor),
                  ),
                  SizedBox(height: 16),
                  Container(
                    //// Today's advice
                    width: double.infinity,
                    constraints: BoxConstraints(maxHeight: 198),
                    padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              S.of(context).academicCertificate,
                              style: AppTextStyles.subTitle2(
                                context,
                              ).copyWith(color: AppColors.blackColor),
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.favorite),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Spacer(),
                        Text("test"),
                      ],
                    ),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        opacity: 0.35,
                        image: AssetImage(Assets.imagesAdviceBackground),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
