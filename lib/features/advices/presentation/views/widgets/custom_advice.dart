import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/features/advices/data/models/advice/advice.dart';

class CustomAdvice extends StatelessWidget {
  const CustomAdvice({super.key, required this.advice});
  final Advice advice;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.whiteColor,
      child: Container(
        width: double.infinity,
        height: 132,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  (advice.title) ??
                      ((Localizations.localeOf(context).languageCode == "ar")
                          ? "عنوان النصيحة"
                          : "Title"),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  // "عنوان النصيحة",
                  style: AppTextStyles.subTitle2(
                    context,
                  ).copyWith(color: AppColors.blackColor),
                ),
                Spacer(),
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                  ),
                  onPressed: () {
                    // TODO: Handle favorite action
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              "اغسل أسنانك مرتين يوميًا على الأقل باستخدام معجون يحتوي على الفلورايد، ولا تنسَ تنظيف اللسان واستخدام خيط الأسنان لإزالة البلاك من بين الأسنان، مع المضمضة بغسول فم مضاد للبكتيريا للحفاظ على صحة اللثة. ",
              style: AppTextStyles.listItem(context),
            ),
          ],
        ),
      ),
    );
  }
}
