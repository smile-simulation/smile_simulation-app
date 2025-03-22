import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/widgets/custom_button.dart';
import 'package:smile_simulation/features/user_account/presentation/views/widgets/edit_user_account_form.dart';
import 'package:smile_simulation/generated/l10n.dart';

import 'user_account_header.dart';
import 'user_account_title.dart';

class EditUserAccountViewBody extends StatelessWidget {
  const EditUserAccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserAccountHeader(currentUser: true),
        Expanded(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45),
                topRight: Radius.circular(45),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserAccountTitle(),
                SizedBox(height: 16),
                Expanded(child: EditUserAccountForm()),
                CustomButton(onPressed: () {}, title: S.of(context).saveEdits),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
