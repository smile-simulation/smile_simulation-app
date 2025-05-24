import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smile_simulation/constant.dart';
import 'package:smile_simulation/core/database/cache/cache_helper.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/features/user_account/presentation/views/user_account_view.dart';
import 'package:smile_simulation/generated/assets.dart';
import 'package:smile_simulation/generated/l10n.dart';

import '../../../../../core/helper_functions/custom_error.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../main.dart';
import '../setting_view.dart';
import 'more_action_item_list_tile.dart';
import 'privacy_policy_dialog.dart';

class MoreViewBody extends StatelessWidget {
  const MoreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBodyScreen(
      child: Container(
        color: AppColors.veryLightGreyColor,
        child: SingleChildScrollView(
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
              const SizedBox(height: 24),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    MoreActionItemListTile(
                      iconPath: Assets.imagesUserAccountIcon,
                      title: S.of(context).profile,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          UserAccountView.routeName,
                          arguments: true,
                        );
                      },
                    ),
                    _buildDivider(),
                    MoreActionItemListTile(
                      iconPath: Assets.imagesSettingsIcon,
                      title: S.of(context).settings,
                      onTap: () {
                        Navigator.pushNamed(context, SettingView.routeName);
                      },
                    ),
                    _buildDivider(),
                    MoreActionItemListTile(
                      iconPath: Assets.imagesPrivacyPolicyIcon,
                      title: S.of(context).privacyPolicy,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => PolicyPoliciesDialog(),
                        );
                      },
                    ),
                    _buildDivider(),
                    MoreActionItemListTile(
                      iconPath: Assets.imagesPrivacyPolicyIcon,
                      title: S.of(context).termsAndConditions,
                      onTap: () {},
                    ),
                    _buildDivider(),
                    MoreActionItemListTile(
                      iconPath: Assets.imagesRateAppIcon,
                      title: S.of(context).rateApp,
                      onTap: () {},
                    ),
                    _buildDivider(),
                    MoreActionItemListTile(
                      iconPath: Assets.imagesShareIcon,
                      title: S.of(context).shareApp,
                      onTap: () {},
                    ),
                    _buildDivider(),
                    MoreActionItemListTile(
                      iconPath: Assets.imagesContactUsIcon,
                      title: S.of(context).contactUs,
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
                    desc: S.of(context).logoutConfirmation,
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
                      onPressed: () async {
                        CacheHelper.sharedPreferences.setBool(
                          isSuccessLogin,
                          false,
                        );
                        CacheHelper().removeMap(key: personalData);
                        CacheHelper().removeData(key: userData);
                        await customSuccess(
                          context,
                          massage: S.of(context).logoutSuccess,
                        );
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SmileSimulation(),
                          ),
                          (route) => false,
                        );
                      },
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
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        SvgPicture.asset(Assets.imagesLogoutIcon),
                        const SizedBox(width: 16),
                        Text(
                          S.of(context).logout,
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
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(
      color: AppColors.meduimLightGrey,
      height: 0,
      thickness: 1.5,
      endIndent: 16,
      indent: 16,
    );
  }
}
