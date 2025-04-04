import 'package:flutter/material.dart';
import 'package:smile_simulation/generated/l10n.dart';

import 'advices_section_header.dart';
import 'categories_list_view_builder.dart';

class AdvicesCategoriesSection extends StatelessWidget {
  const AdvicesCategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AdvicesSectionHeader(
          sectionTitle: S.of(context).advicesCategories,
          seeAllOnTap: () {},
        ),
        SizedBox(height: 16),
        SizedBox(height: 212, child: CategoriesListViewBuilder()),
      ],
    );
  }
}
