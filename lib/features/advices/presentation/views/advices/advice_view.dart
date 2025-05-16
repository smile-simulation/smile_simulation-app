import 'package:flutter/material.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/features/advices/presentation/views/advices/widgets/advice_view_body.dart';

import '../../../../../core/helper_functions/my_launch_url.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/advice/advice.dart';

class AdviceView extends StatelessWidget {
  const AdviceView({super.key, required this.advice});

  static const routeName = 'adviceView';
  final Advice advice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        context,
        title: advice.title ?? S.of(context).adviceTitleError,
        isBack: true,
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: AppColors.whiteColor,
        padding: const EdgeInsets.all(12.0),
        child: Visibility(
          visible: advice.link != null,
          child: InkWell(
            onTap: () {
              myLaunchUrl(url: advice.link);
            },
            child: Text(
              "🔗 فيديو نصائح العناية اليومية بالأسنان",
              style: AppTextStyles.formLabel(
                context,
              ).copyWith(color: AppColors.primaryColor),
            ),
          ),
        ),
      ),
      body: AdviceViewBody(advice: advice),
    );
  }
}
