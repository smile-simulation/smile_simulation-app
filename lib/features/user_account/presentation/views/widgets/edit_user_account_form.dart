import 'package:flutter/material.dart';
import 'package:smile_simulation/generated/l10n.dart';

import 'editable_user_info_field.dart';

class EditUserAccountForm extends StatelessWidget {
  const EditUserAccountForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          EditableUserInfoField(
            title: S.of(context).practicalExperience,
            icon: Icons.work_outline,
          ),
          SizedBox(height: 32),
          EditableUserInfoField(
            title: S.of(context).location,
            icon: Icons.location_on_outlined,
          ),
          SizedBox(height: 32),
          EditableUserInfoField(
            title: S.of(context).gender,
            icon: Icons.person_outline,
          ),
          SizedBox(height: 32),
          EditableUserInfoField(
            title: S.of(context).dateOfBirth,
            icon: Icons.date_range,
          ),
        ],
      ),
    );
  }
}
