import 'package:flutter/material.dart';
import 'package:smile_simulation/generated/l10n.dart';

import '../../../../../constant.dart';
import '../../../../../core/database/cache/cache_helper.dart';
import '../../../../../core/widgets/user_details_list_tile.dart';

class UserDetailsSection extends StatelessWidget {
  const UserDetailsSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: CacheHelper().getMap(key: userData)?['rule'] =="Doctor",
          child: CustomListTile(
            // title: S.of(context).practicalExperience,
            title: S.of(context).practicalExperience,
            subTitle: CacheHelper().getMap(key: userData)?['experience'],
            icon: Icons.work_outline,
          ),
        ),
        CustomListTile(
          title: S.of(context).location,
          subTitle: CacheHelper().getMap(key: userData)?['address'],
          icon: Icons.location_on_outlined,
        ),

        CustomListTile(title: S.of(context).gender,
            subTitle: CacheHelper().getMap(key: userData)?['gender'],

            icon: Icons.person_outline),
        CustomListTile(
          title: S.of(context).dateOfBirth,
        subTitle:   CacheHelper().getMap(key: userData)?['birthDay'],
          icon: Icons.date_range,
        ),
      ],
    );
  }
}
