import 'package:flutter/material.dart';
import 'package:smile_simulation/core/widgets/custom_app_bar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/features/advices/data/models/advice/advice.dart';
import 'package:smile_simulation/generated/l10n.dart';

import 'advice_view_body_content.dart';

class AdviceViewBody extends StatelessWidget {
  const AdviceViewBody({super.key, required this.advice});
  final Advice advice;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomBodyScreen(child: AdviceViewBodyContent(advice: advice)),
    );
  }
}
