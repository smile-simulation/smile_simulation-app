import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/features/advices/presentation/views/category_advices/all_categories_view.dart';
import 'package:smile_simulation/generated/l10n.dart';

import '../../../managers/cubits/advices_cubit/advices_cubit.dart';
import 'advices_section_header.dart';
import 'categories_list_view_builder.dart';

class AdvicesCategoriesSection extends StatelessWidget {
  const AdvicesCategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    AdvicesCubit cubit = context.read<AdvicesCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<AdvicesCubit, AdvicesState>(
          builder: (BuildContext context, AdvicesState state) {
            return AdvicesSectionHeader(
              sectionTitle: S.of(context).advicesCategories,
              seeAllOnTap: () {
                if (cubit.advicesCategories.isNotEmpty) {
                  Navigator.pushNamed(
                    context,
                    AllCategoriesView.routeName,
                    arguments: cubit.advicesCategories,
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: AppColors.primaryColor,
                      closeIconColor: AppColors.whiteColor,
                      content: Text(
                        S.of(context).noCategoriesAdvicesExist,
                        style: AppTextStyles.button2(
                          context,
                        ).copyWith(color: AppColors.whiteColor),
                      ),
                    ),
                  );
                }
              },
            );
          },
        ),
        SizedBox(height: 8),
        SizedBox(height: 212, child: CategoriesListViewBuilder()),
      ],
    );
  }
}
