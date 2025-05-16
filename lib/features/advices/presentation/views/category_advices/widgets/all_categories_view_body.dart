import 'package:flutter/material.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/features/advices/data/models/advices_category/advices_category.dart';

import 'categories_grid_view.dart';

class AllCategoriesViewBody extends StatelessWidget {
  const AllCategoriesViewBody({super.key, required this.categories});
  final List<AdvicesCategory> categories;
  @override
  Widget build(BuildContext context) {
    return CustomBodyScreen(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: CategoriesGridView(categories: categories),
      ),
    );
  }
}
