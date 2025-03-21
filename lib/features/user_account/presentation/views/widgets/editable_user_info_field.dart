import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/widgets/custom_text_field.dart';
import 'package:smile_simulation/core/widgets/custom_icon.dart';

import 'user_details_list_tile.dart';

class EditableUserInfoField extends StatefulWidget {
  const EditableUserInfoField({
    super.key,
    required this.title,
    required this.icon,
  });
  final String title;
  final IconData icon;
  @override
  State<EditableUserInfoField> createState() => _EditableUserInfoFieldState();
}

class _EditableUserInfoFieldState extends State<EditableUserInfoField> {
  bool edit = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Visibility(
          visible: !edit,
          child: Expanded(
            child: CustomTextField(
              hintText: widget.title,
              keyboardType: TextInputType.text,
            ),
          ),
        ),
        Visibility(
          visible: edit,
          child: Expanded(
            child: UserDetailsListTile(title: widget.title, icon: widget.icon),
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
