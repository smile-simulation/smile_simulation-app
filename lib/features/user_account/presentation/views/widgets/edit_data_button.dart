import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/generated/l10n.dart';

import '../../../../../core/helper_functions/custom_error.dart';


class EditDataButton extends StatelessWidget {
  const EditDataButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
       // comingSoon(context);
         Navigator.pushNamed(context, EditUserAccountView.routeName);
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
          S.of(context).editUserInformation,
          style: AppTextStyles.subTitle2(
            context,
          ).copyWith(color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
