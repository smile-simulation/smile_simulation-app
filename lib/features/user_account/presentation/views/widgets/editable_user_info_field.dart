
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/widgets/custom_text_field.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/widgets/custom_icon.dart';
import 'package:smile_simulation/generated/l10n.dart';

import 'user_details_list_tile.dart';

class EditableUserInfoField extends StatefulWidget {
  const EditableUserInfoField({super.key});

  @override
  State<EditableUserInfoField> createState() =>
      _EditableUserInfoFieldState();
}

class _EditableUserInfoFieldState
    extends State<EditableUserInfoField> {
  bool edit = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Visibility(
          visible: !edit,
          child: Expanded(
            child: CustomTextField(
              hintText: 'hintText',
              keyboardType: TextInputType.text,
              // title: 'fd',
            ),
          ),
        ),
        Visibility(
          visible: edit,
          child: Expanded(
            child: UserDetailsListTile(
              title: S.of(context).practicalExperience,
              icon: Icons.work_outline,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomIcon(
            icon: Icons.edit,
            color: AppColors.primaryColor,
            onTap: () {
              edit = !edit;
              setState(() {});
              log("Edit Persoanl data ");
            },
          ),
        ),
      ],
    );
  }
}
