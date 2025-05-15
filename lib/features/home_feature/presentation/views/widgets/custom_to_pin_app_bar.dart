import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/generated/assets.dart';

import '../../../../search_feature/presentation/views/searchview.dart';
import 'clickable_search_bar.dart';

class CustomToPinAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomToPinAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: kToolbarHeight + 40,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(color: AppColors.primaryColor),
      child: Row(
        children: [
          Expanded(child: ClickableSearchBar()),
          SizedBox(width: 16),
       InkWell(
         onTap: () {
           Navigator.of(
             context,
           ).push(MaterialPageRoute(builder: (context) => SearchView()));
         },
         child: SvgPicture.asset(
           Assets.imagesSearch,
         ),
       )
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 40);
}
