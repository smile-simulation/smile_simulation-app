import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/widgets/custom_text_field.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/widgets/custom_icon.dart';
import 'package:smile_simulation/generated/l10n.dart';

import 'user_details_list_tile.dart';

class EditUserAccountForm extends StatelessWidget {
  const EditUserAccountForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EditableUserInfoField(),

        UserDetailsListTile(
          title: S.of(context).practicalExperience,
          icon: Icons.work_outline,
        ),
        UserDetailsListTile(
          title: S.of(context).location,
          icon: Icons.location_on_outlined,
        ),
        UserDetailsListTile(
          title: S.of(context).gender,
          icon: Icons.person_outline,
        ),
        UserDetailsListTile(
          title: S.of(context).dateOfBirth,
          icon: Icons.date_range,
        ),
      ],
    );
  }
}
