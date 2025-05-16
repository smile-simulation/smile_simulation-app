import 'package:flutter/material.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';

import 'category_advices_list_view_builder.dart';

class CategoryAdvicesViewBody extends StatelessWidget {
  const CategoryAdvicesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBodyScreen(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: CategoryAdvicesListViewBuilder(),
      ),
    );
  }
}
