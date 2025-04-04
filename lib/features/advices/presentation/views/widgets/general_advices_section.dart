import 'package:flutter/material.dart';
import 'package:smile_simulation/generated/l10n.dart';

import 'advices_section_header.dart';
import 'general_advices_list_view_builder.dart';

class GeneralAdvicesSection extends StatelessWidget {
  const GeneralAdvicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        AdvicesSectionHeader(
          sectionTitle: S.of(context).generalAdvices,
          seeAllOnTap: () {},
        ),

        SizedBox(height: 16),
        GeneralAdvicesListViewBuilder(),
      ],
    );
  }
}
