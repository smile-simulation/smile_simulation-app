import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_translation.dart';

import 'user_details_list_tile.dart';

class UserDetailsSection extends StatelessWidget {
  const UserDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserDetailsListTIle(
          title: TranslationKeys.practicalExperience,
          icon: Icons.work_outline,
        ),
        UserDetailsListTIle(
          title: TranslationKeys.location,
          icon: Icons.location_on_outlined,
        ),
        UserDetailsListTIle(
          title: TranslationKeys.gender,
          icon: Icons.person_outline,
        ),
        UserDetailsListTIle(
          title: TranslationKeys.dateOfBirth,
          icon: Icons.date_range,
        ),
      ],
    );
  }
}
