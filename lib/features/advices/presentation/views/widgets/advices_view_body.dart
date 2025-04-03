import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_app_bar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/core/widgets/sliver_sized_box.dart';
import 'package:smile_simulation/features/advices/presentation/views/widgets/advices_categories_section.dart';
import 'package:smile_simulation/features/advices/presentation/views/widgets/custom_advice.dart';
import 'package:smile_simulation/generated/l10n.dart';

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
                SliverToBoxAdapter(child: TodaysAdviceSection()),
                SliverSizedBox(height: 24),
                SliverToBoxAdapter(child: AdvicesCategoriesSection()),

                
                SliverSizedBox(height: 24),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16),
                      Text(
                        S.of(context).posts,
                        style: AppTextStyles.headline2(
                          context,
                        ).copyWith(color: AppColors.blackColor),
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),

                SliverList.separated(
                  itemBuilder: (context, index) {
                    return CustomAdvice();
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 16),
                  itemCount: 5,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
