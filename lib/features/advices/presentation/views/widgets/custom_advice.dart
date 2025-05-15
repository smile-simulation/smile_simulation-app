import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/features/advices/data/models/advice/advice.dart';
import 'package:smile_simulation/features/advices/presentation/views/advices/advice_view.dart';
import 'package:smile_simulation/generated/l10n.dart';

import 'advice_header.dart';

class CustomAdvice extends StatelessWidget {
  const CustomAdvice({super.key, required this.advice});

  final Advice advice;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AdviceView.routeName, arguments: advice);
      },
      child: Card(
        color: AppColors.whiteColor,
        child: Container(
          width: double.infinity,
          height: 135,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.primaryColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AdviceHeader(adviceTitle: advice.title),
              SizedBox(height: 8),
              Text(
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              advice.description ?? S.of(context).adviceContentError,
                style: AppTextStyles.listItem(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
