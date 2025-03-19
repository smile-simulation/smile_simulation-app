import 'package:flutter/material.dart';
import 'package:smile_simulation/generated/l10n.dart';

import 'user_details_list_tile.dart';

class UserDetailsSection extends StatelessWidget {
  const UserDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserDetailsListTIle(
          title: S.of(context).practicalExperience,
          icon: Icons.work_outline,
        ),
        UserDetailsListTIle(
          title: S.of(context).location,
          icon: Icons.location_on_outlined,
        ),
        UserDetailsListTIle(
          title: S.of(context).gender,
          icon: Icons.person_outline,
        ),
        UserDetailsListTIle(
          title: S.of(context).dateOfBirth,
          icon: Icons.date_range,
        ),
      ],
    );
  }
}
