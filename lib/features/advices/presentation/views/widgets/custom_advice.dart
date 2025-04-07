import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/features/advices/data/models/advice/advice.dart';
import 'package:smile_simulation/features/advices/presentation/views/advice/advice_view.dart';
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
          height: 132,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AdviceHeader(adviceTitle: advice.title),
              SizedBox(height: 8),
              Text(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                // "اغسل أسنانك مرتين يوميًا على الأقل باستخدام معجون يحتوي على الفلورايد، ولا تنسَ تنظيف اللسان واستخدام خيط الأسنان لإزالة البلاك من بين الأسنان، مع المضمضة بغسول فم مضاد للبكتيريا للحفاظ على صحة اللثة. ",
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
