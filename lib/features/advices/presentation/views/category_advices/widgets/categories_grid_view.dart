import 'package:flutter/material.dart';
import 'package:smile_simulation/features/advices/data/models/advices_category/advices_category.dart';
import 'package:smile_simulation/features/advices/presentation/views/widgets/category_item_card.dart';

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({super.key, required this.categories});
  final List<AdvicesCategory> categories;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.25,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return CategoryItemCard(category: categories[index]);
      },
    );
  }
}
