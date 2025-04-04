import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/features/advices/data/models/advices_category/advices_category.dart';
import 'package:smile_simulation/generated/assets.dart';

class CategoryItemCard extends StatelessWidget {
  const CategoryItemCard({super.key, required this.category});
  final AdvicesCategory category;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Container(
        width: 180,
        height: 200,
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
              child:
                  category.image == null
                      ? Image.asset(
                        Assets.tempDailyCare,
                        width: double.infinity,
                        height: 120,
                        fit: BoxFit.cover,
                      )
                      : Image.network(
                        errorBuilder: (context, error, stackTrace) {
                          return Center(child: Text("In valid image"));
                        },
                        category.image!,
                        width: double.infinity,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
            ),
            SizedBox(height: 12),
            Text(
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
              category.name ?? "اسم غير صالح",
              style: AppTextStyles.subTitle2(context),
            ),
          ],
        ),
      ),
    );
  }
}
