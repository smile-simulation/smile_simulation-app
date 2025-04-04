import 'package:flutter/material.dart';

import '../../../data/models/advices_category/advices_category.dart';
import 'category_item_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key, required this.advicesCategories});
  final List<AdvicesCategory> advicesCategories;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) {
        if (advicesCategories.isEmpty) {
          return Text("No Categories");
        } else {
          return CategoryItemCard(category: advicesCategories[index]);
        }
      },
      separatorBuilder: (context, index) => SizedBox(width: 16),
      itemCount: advicesCategories.length,
    );
  }
}
