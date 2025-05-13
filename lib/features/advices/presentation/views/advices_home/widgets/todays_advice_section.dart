import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/generated/l10n.dart';

import 'todays_advice_builder.dart';

class TodaysAdviceSection extends StatelessWidget {
  const TodaysAdviceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        Text(
          S.of(context).toDaysAdvice,
          style: AppTextStyles.headline2(
            context,
          ).copyWith(color: AppColors.blackColor),
        ),
        SizedBox(height: 8),
        TodaysAdviceBuilder(),
      ],
    );
  }
}
