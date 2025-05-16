import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/generated/l10n.dart';
import '../../../../../constant.dart';
import '../../../../../core/database/cache/cache_helper.dart';
import '../../../../../generated/assets.dart';
import '../../../../chatb_bot_feature/presentation/views/chat_bot_view.dart';
import 'custom_to_pin_app_bar.dart';

class CustomFlexibleAppBar extends StatelessWidget {
  CustomFlexibleAppBar({super.key});

  final String name = CacheHelper().getMap(key: 'userData')!['fullName'] ?? '';

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      centerTitle: true,
      floating: true,
      pinned: true,
      bottom: CustomToPinAppBar(),
      backgroundColor: AppColors.primaryColor,

      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage:
                CacheHelper().getMap(key: userData)!['image'] != null
                    ? NetworkImage(
                      CacheHelper().getMap(key: userData)!['image'],
                    )
                    : const AssetImage(Assets.imagesUser),
            radius: 22,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              '${S.of(context).welcomeMsg}، $name!',
              overflow: TextOverflow.ellipsis,

              style: AppTextStyles.headline2(
                context,
              ).copyWith(color: AppColors.whiteColor),
            ),
          ),
          InkWell(
            onTap: () {},
            child: SvgPicture.asset(Assets.imagesNotification),
          ),
          SizedBox(width: 12),
          InkWell(
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => ChatBotView()));
            },
            child: SvgPicture.asset(Assets.imagesChat),
          ),
        ],
      ),
    );
  }
}
