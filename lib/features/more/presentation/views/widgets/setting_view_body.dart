import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smile_simulation/features/more/presentation/views/widgets/more_action_item_list_tile.dart';
import 'package:smile_simulation/features/more/presentation/views/widgets/more_view_body.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_body_screen.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/assets.dart';
import '../../../../user_account/presentation/views/user_account_view.dart';




class SettingViewBody extends StatelessWidget {
  const SettingViewBody({
    super.key,
  });

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
                "حول الحساب",
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
                    title: "تعديل البيانات الشخصية",
                    onTap: () {

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
                    iconPath: Assets.imagesChagePassword,
                    title: "تغيير كلمة المرور",
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
                    iconPath: Assets.imagesChageLanguge,
                    title: "تغيير اللغة",
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
                    iconPath: Assets.imagesNotification2,
                    title: "الإشعارات",
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                      focusColor: AppColors.whiteColor,
                      inactiveThumbColor: AppColors.whiteColor,
                      inactiveTrackColor: AppColors.primaryColor.withOpacity(
                        0.3,
                      ),

                      activeColor: AppColors.primaryColor,

                      activeTrackColor: AppColors.primaryColor.withOpacity(
                        0.3,
                      ),
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
                  title: "تأكيد",
                  desc: "هل أنت متأكد أنك تريد حذف الحساب ؟",
                  btnCancel: CustomButton(
                    title: "إلغاء",
                    isSecondary: true,
                    isMinWidth: true,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  btnOk: CustomButton(
                    title: "تأكيد",
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
                        "حذف الحساب",
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
