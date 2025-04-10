import 'package:flutter/material.dart';
import 'package:smile_simulation/core/widgets/custom_app_bar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/features/advices/data/models/advices_category/advices_category.dart';
import 'package:smile_simulation/generated/l10n.dart';

import 'categories_grid_view.dart';

class AllCategoriesViewBody extends StatelessWidget {
  const AllCategoriesViewBody({super.key, required this.categories});
  final List<AdvicesCategory> categories;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomAppBar(
          title: S.of(context).advicesCategories,
          icon: Icons.arrow_back,
        ),
        Expanded(
          child: CustomBodyScreen(
            child: CategoriesGridView(categories: categories),
          ),
        ),
      ],
    );
  }
}
