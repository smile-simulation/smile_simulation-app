import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/generated/l10n.dart';

class AdviceHeader extends StatelessWidget {
  const AdviceHeader({super.key, required this.adviceTitle});

  final String? adviceTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          (adviceTitle) ?? S.of(context).adviceTitleError,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.subTitle2(
            context,
          ).copyWith(color: AppColors.blackColor),
        ),
        Spacer(),
        Container(
          child: Icon(
            Icons.arrow_forward_ios_outlined,
            color: AppColors.whiteColor,
            size: 20,
          ),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.only(left: 4, top: 4),
        ),
      ],
    );
  }
}
