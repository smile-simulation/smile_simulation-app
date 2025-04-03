import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/generated/assets.dart';
import 'package:smile_simulation/generated/l10n.dart';

class AdvicesCategoriesSection extends StatelessWidget {
  const AdvicesCategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.of(context).advicesCategories,
                style: AppTextStyles.headline2(context),
              ),
              InkWell(
                child: Text(
                  S.of(context).showAll,
                  style: AppTextStyles.subTitle2(
                    context,
                  ).copyWith(color: AppColors.primaryColor),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        SizedBox(
          height: 200,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Container(
                  width: 180,
                  height: 188,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        spreadRadius: 2,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          Assets.tempDailyCare,
                          width: double.infinity,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        "العناية اليومية",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 16),
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}
