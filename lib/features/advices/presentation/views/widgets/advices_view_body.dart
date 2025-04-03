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
                    width: double.infinity,
                    constraints: BoxConstraints(minHeight: 198),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        opacity: 0.35,
                        image: AssetImage(Assets.imagesAdviceBackground),
                        fit: BoxFit.cover,
                      ),
                    ),
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
                              onPressed: () {
                                // TODO: Handle favorite action
                              },
                              icon: Icon(
                                Icons.favorite_border,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          "اغسل أسنانك مرتين يوميًا على الأقل باستخدام معجون يحتوي على الفلورايد، ولا تنسَ تنظيف اللسان واستخدام خيط الأسنان لإزالة البلاك من بين الأسنان، مع المضمضة بغسول فم مضاد للبكتيريا للحفاظ على صحة اللثة. ",
                          style: AppTextStyles.listItem(context),
                        ),
                        // Expanded(
                        //   child: SizedBox(),
                        // ), // يجعل النص في المنتصف بدلاً من `Spacer`
                        Positioned(
                          bottom: 0,
                          child: Text(
                            "🔗 فيديو نصائح العناية اليومية بالأسنان",
                            style: AppTextStyles.formLabel(
                              context,
                            ).copyWith(color: AppColors.primaryColor),
                          ),
                        ),
                      ],
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
