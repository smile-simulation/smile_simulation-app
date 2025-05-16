import 'package:flutter/material.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/features/advices/data/models/advices_category/advices_category.dart';

import '../../../../../generated/l10n.dart';
import 'widgets/all_categories_view_body.dart';

class AllCategoriesView extends StatelessWidget {
  const AllCategoriesView({super.key, required this.categories});
  static const routeName = 'allCategoriesView';
  final List<AdvicesCategory> categories;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        context,
        title: S.of(context).advicesCategories,
        isBack: true,
      ),
      body: AllCategoriesViewBody(categories: categories),
    );
  }
}
