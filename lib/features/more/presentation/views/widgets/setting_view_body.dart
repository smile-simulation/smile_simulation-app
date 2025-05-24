import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smile_simulation/features/more/presentation/views/language_view.dart';
import 'package:smile_simulation/features/more/presentation/views/widgets/more_action_item_list_tile.dart';
import 'package:smile_simulation/generated/l10n.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_body_screen.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/assets.dart';
import '../../../../user_account/presentation/views/user_account_view.dart';
import '../change_password_view.dart';




class SettingViewBody extends StatelessWidget {
  const SettingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBodyScreen(
      child: Container(
        color: AppColors.veryLightGreyColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                S.of(context).aboutApp,
                style: AppTextStyles.headline2(
                  context,
                ).copyWith(color: AppColors.greyColor),
              ),
            ),
            SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(12),
              ),
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  MoreActionItemListTile(
                    iconPath: Assets.imagesUserAccountIcon,
                    title: S.of(context).editPersonalInfo,
                    onTap: () {},
                  ),
                  Divider(
                    color: AppColors.meduimLightGrey,
                    height: 0,
                    thickness: 1.5,
                    endIndent: 16,
                    indent: 16,
                  ),
                  MoreActionItemListTile(
                    iconPath: Assets.imagesChagePassword,

                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        ChangePasswordView.routeName,
                      );
                    },
                    title: S.of(context).changePassword,

                  ),
                  Divider(
                    color: AppColors.meduimLightGrey,
                    height: 0,
                    thickness: 1.5,
                    endIndent: 16,
                    indent: 16,
                  ),
                  MoreActionItemListTile(
                    iconPath: Assets.imagesChageLanguge,
                    title: S.of(context).changeLanguage,
                    onTap: () {
                      Navigator.pushNamed(context, LanguageView.routeName);
                    },
                  ),
                  Divider(
                    color: AppColors.meduimLightGrey,
                    height: 0,
                    thickness: 1.5,
                    endIndent: 16,
                    indent: 16,
                  ),
                  MoreActionItemListTile(
                    iconPath: Assets.imagesNotification2,
                    title: S.of(context).notifications,
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                      focusColor: AppColors.whiteColor,
                      inactiveThumbColor: AppColors.whiteColor,
                      inactiveTrackColor: AppColors.primaryColor.withOpacity(
                        0.3,
                      ),

                      activeColor: AppColors.primaryColor,

                      activeTrackColor: AppColors.primaryColor.withOpacity(0.3),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            InkWell(
              onTap: () {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.warning,
                  animType: AnimType.topSlide,
                  title: S.of(context).confirm,
                  desc: S.of(context).deleteAccountConfirmation,
                  btnCancel: CustomButton(
                    title: S.of(context).cancel,
                    isSecondary: true,
                    isMinWidth: true,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  btnOk: CustomButton(
                    title: S.of(context).confirm,
                    isMinWidth: true,
                    onPressed: () async {},
                  ),
                ).show();
              },

              borderRadius: BorderRadius.circular(12),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 16),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Center(
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        Assets.imagesAccountDelete,
                        color: AppColors.redColor,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        S.of(context).deleteAccount,
                        style: AppTextStyles.subTitle1(context).copyWith(
                          fontFamily: "NotoSansSC",
                          color: AppColors.grayHeavyText_1Color,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
