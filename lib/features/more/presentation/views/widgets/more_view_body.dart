import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';
import 'package:smile_simulation/constant.dart';
import 'package:smile_simulation/core/database/cache/cache_helper.dart';
import 'package:smile_simulation/core/helper_functions/my_launch_url.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/features/about_us/presentaion/views/about_us_view.dart';
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
    Locale myLocale = Localizations.localeOf(context);
    print(myLocale.languageCode); // مثال: "en" أو "ar"

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
                      onTap: () async {
                        showDialog(
                          context: context,
                          builder:
                              (context) => CustomPoliciesAndConditionsDialog(
                                title: S.of(context).privacyPolicy,
                                path:
                                    myLocale.languageCode == 'en'
                                        ? "assets/policies_and_conditions/privacy_policy.md"
                                        : "assets/policies_and_conditions/privacy_policy_ar.md",
                              ),
                        );
                      },
                    ),
                    _buildDivider(),
                    MoreActionItemListTile(
                      iconPath: Assets.imagesPrivacyPolicyIcon,
                      title: S.of(context).termsAndConditions,
                      onTap: () async {
                        showDialog(
                          context: context,
                          builder:
                              (context) => CustomPoliciesAndConditionsDialog(
                                title: S.of(context).termsAndConditions,
                                path:
                                    myLocale.languageCode == 'en'
                                        ? "assets/policies_and_conditions/terms_and_conditions.md"
                                        : "assets/policies_and_conditions/terms_and_conditions_ar.md",
                              ),
                        );
                      },
                    ),
                    _buildDivider(),
                    MoreActionItemListTile(
                      iconPath: Assets.imagesRateAppIcon,
                      title: S.of(context).rateApp,
                      onTap: () async {
                        const playStoreUrl =
                            'https://play.google.com/store/apps/details?id=com.simulation.smile';
                        const appStoreUrl =
                            'https://apps.apple.com/app/idYOUR_APP_ID'; // Replace with your App Store ID if available

                        myLaunchUrl(
                          url: Platform.isAndroid ? playStoreUrl : appStoreUrl,
                        );
                      },
                    ),
                    _buildDivider(),
                    MoreActionItemListTile(
                      iconPath: Assets.imagesShareIcon,
                      title: S.of(context).shareApp,
                      onTap: () {
                        const appUrl =
                            'https://play.google.com/store/apps/details?id=com.simulation.smile';
                        const message =
                            'Check out Smile Simulation App! It helps manage dental health with personalized advice and reminders🩵.\n\n Download it here: $appUrl';

                        Share.share(
                          message,
                          subject: 'Try Smile Simulation App',
                        );
                      },
                    ),
                    _buildDivider(),
                    MoreActionItemListTile(
                      iconPath: Assets.imagesAboutUs,
                      title: S.of(context).aboutUs,
                      onTap: () {
                        Navigator.pushNamed(context, AboutUsView.routeName);
                      },
                    ),
                    _buildDivider(),
                    MoreActionItemListTile(
                      iconPath: Assets.imagesContactUsIcon,
                      title: S.of(context).contactUs,
                      onTap: () async {
                        final emailUrl =
                            Uri(
                              scheme: 'mailto',
                              path: 'MahmoudMagdy176203@gmail.com',
                              queryParameters: {
                                'subject': 'Smile Simulation Support',
                                'body':
                                    'Hello, I have a question about the app...\n\n\n\nApp ID: com.simulation.smile\nApp Version: 1.0.0\nDevice: ${Platform.operatingSystem}',
                              },
                            ).toString();

                        try {
                          await myLaunchUrl(url: emailUrl);
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Could not open email client: $e'),
                            ),
                          );
                        }
                      },
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
                        //CacheHelper().removeMap(key: personalData);
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
                        Transform.scale(
                          scaleX:
                              CacheHelper.sharedPreferences.getString(
                                        'language',
                                      ) ==
                                      'ar'
                                  ? 1
                                  : -1,
                          scaleY: 1,
                          child: SvgPicture.asset(Assets.imagesLogoutIcon),
                        ),
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
