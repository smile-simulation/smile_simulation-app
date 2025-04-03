import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/features/advices/presentation/views/widgets/custom_advice.dart';
import 'package:smile_simulation/features/advices/presentation/views/widgets/custom_todays_advice.dart';
import 'package:smile_simulation/generated/l10n.dart';

class TodaysAdviceSection extends StatelessWidget {
  const TodaysAdviceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SliverSizedBox(height: 16),
        SizedBox(height: 16),
        Text(
          S.of(context).posts,
          style: AppTextStyles.headline2(
            context,
          ).copyWith(color: AppColors.blackColor),
        ),
        SizedBox(height: 16),
        // SliverSizedBox(height: 16),
        CustomTodaysAdvice(),
      ],
    );
  }
}
