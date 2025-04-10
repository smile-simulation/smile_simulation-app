import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/features/advices/data/models/advice/advice.dart';
import 'package:smile_simulation/generated/l10n.dart';

import 'custom_todays_advice.dart';

class TodaysAdviceSection extends StatelessWidget {
  const TodaysAdviceSection({super.key, this.advice});
  final Advice? advice;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SliverSizedBox(height: 16),
        SizedBox(height: 16),
        Text(
          S.of(context).toDaysAdvice,
          style: AppTextStyles.headline2(
            context,
          ).copyWith(color: AppColors.blackColor),
        ),
        SizedBox(height: 16),
        // SliverSizedBox(height: 16),
        CustomTodaysAdvice(
          advice:
              advice ??
              Advice(
                image:
                    'http://smilesimulation.runasp.net/Advice/93bae9f2-5e5b-47a7-91ba-b65bf4193fecimageProfile.jpeg',
              ),
        ),
      ],
    );
  }
}
