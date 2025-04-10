import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:smile_simulation/core/helper_functions/app_timing.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/features/advices/data/models/advice/advice.dart';
import 'package:smile_simulation/generated/assets.dart';
import 'package:smile_simulation/generated/l10n.dart';

class CustomTodaysAdvice extends StatelessWidget {
  const CustomTodaysAdvice({super.key, required this.advice});
  final Advice advice;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: 198),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          opacity: 0.25,
          image:
              advice.image != null
                  ? NetworkImage(advice.image!)
                  : AssetImage(Assets.imagesAdviceBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    S.of(context).toDaysAdvice,
                    style: AppTextStyles.subTitle2(
                      context,
                    ).copyWith(color: AppColors.blackColor),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () async {
                      // AdvicesRepoImpl(
                      //   dioConsumer: DioConsumer(dio: Dio()),
                      // ).getGeneralAdvices();
                      DateTime now = DateTime.now();
                      DateTime elevenPM = DateTime(
                        now.year,
                        now.month,
                        now.day,
                        23,
                        0,
                        0,
                      );

                      print(elevenPM);
                      AppTiming().runFunAtX(
                        time: elevenPM,
                        action: () async {
                          log("hello from the Future");
                        },
                      );
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
            ],
          ),

          Text(
            "🔗 فيديو نصائح العناية اليومية بالأسنان",
            style: AppTextStyles.formLabel(
              context,
            ).copyWith(color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }
}
