import 'package:flutter/material.dart';
import 'package:smile_simulation/core/widgets/custom_app_bar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';

import 'todays_advice_section.dart';

class AdvicesViewBody extends StatelessWidget {
  const AdvicesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(title: 'النصائح'),
        Expanded(
          child: CustomBodyScreen(
            child: CustomScrollView(
              slivers: [
                TodaysAdviceSection(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
