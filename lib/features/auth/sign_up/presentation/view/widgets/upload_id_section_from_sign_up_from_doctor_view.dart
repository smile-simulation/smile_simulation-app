import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../constant.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_text_styles.dart';
import '../../../../../../generated/assets.dart';
import '../../../../../../generated/l10n.dart';

class UploadIDSectionFromSignUpFromDoctorView extends StatelessWidget {
  const UploadIDSectionFromSignUpFromDoctorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        Align(
          alignment:
              isArabic == 'ar' ? Alignment.centerRight : Alignment.centerLeft,
          child: Text(
            S.of(context).uploadIDCard,
            style: AppTextStyles.formLabel(context),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: AspectRatio(
            aspectRatio: 2,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.veryLightGreyColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: SvgPicture.asset(Assets.imagesScanCamera)),
            ),
          ),
        ),
      ],
    );
  }
}
