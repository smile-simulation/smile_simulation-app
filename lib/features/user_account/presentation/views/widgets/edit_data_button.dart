import 'package:flutter/material.dart';
import 'package:smile_simulation/core/services/localization_helper.dart';
import 'package:smile_simulation/core/services/navigations.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/utils/app_translation.dart';
import 'package:smile_simulation/features/user_account/presentation/views/edit_user_account_view.dart';

class EditDataButton extends StatelessWidget {
  const EditDataButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // navigateTo(context, EditUserAccountView());
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return EditUserAccountView();
            },
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        // height: 40,
        child: Text(
          LocalizationHelper.translate(TranslationKeys.editUserInformation),
          style: AppTextStyles.style14W700(
            context,
          ).copyWith(color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
