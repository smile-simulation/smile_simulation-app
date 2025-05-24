import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smile_simulation/core/database/cache/cache_helper.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/generated/assets.dart';

import '../../../../generated/l10n.dart';
import '../../../../main.dart';



class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  static const routeName = 'language_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, title: S.of(context).language, isBack: true),
      body: CustomBodyScreen(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              InkWell(
                onTap: () => _changeLanguage(context, 'ar'),
                child: _languageRow(context, S.of(context).arabic, Assets.imagesSa, localeNotifier.value.languageCode == 'ar'),
              ),
              Divider(
                color: AppColors.meduimLightGrey,
                height: 0,
                thickness: 1.5,
              ),
              InkWell(
                onTap: () => _changeLanguage(context, 'en'),
                child: _languageRow(context, S.of(context).english, Assets.imagesUkm, localeNotifier.value.languageCode == 'en'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _languageRow(BuildContext context, String title, String icon, bool selected) {
    return Container(
      height: 54,
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 16),
          Text(
            title,
            style: AppTextStyles.headline3(context),
          ),
          const Spacer(),
          Visibility(
            visible: selected,
            child: SvgPicture.asset(Assets.imagesYes),
          ),
        ],
      ),
    );
  }

  void _changeLanguage(BuildContext context, String languageCode) async {
    await CacheHelper().saveData(key: 'language', value: languageCode);
    localeNotifier.value = Locale(languageCode);
  }
}