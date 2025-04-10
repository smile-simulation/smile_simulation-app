import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/generated/l10n.dart';

class AdvicesSectionHeader extends StatelessWidget {
  const AdvicesSectionHeader({
    super.key,
    required this.sectionTitle,
    required this.seeAllOnTap,
  });
  final String sectionTitle;
  final Function() seeAllOnTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(sectionTitle, style: AppTextStyles.headline2(context)),
          InkWell(
            onTap: seeAllOnTap,
            child: Text(
              S.of(context).showAll,
              style: AppTextStyles.subTitle2(
                context,
              ).copyWith(color: AppColors.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
