
import 'package:flutter/material.dart';
import '../../../../../../core/utils/app_text_styles.dart';
import '../../../../../../generated/assets.dart';
import '../../../../../../generated/l10n.dart';
import 'media_button.dart';

class LogInWithMediaSection extends StatelessWidget {
  const LogInWithMediaSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        Text(S.of(context).signInWith, style: AppTextStyles.caption1(context)),
        SizedBox(),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MediaButton(title: 'Google', image: Assets.imagesGoogle),
            MediaButton(title: 'Facebook', image: Assets.imagesFacebook),
          ],
        ),
      ],
    );
  }
}
