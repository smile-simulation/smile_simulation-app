import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/widgets/custom_icon.dart';
import 'package:smile_simulation/features/search_feature/presentation/views/searchview.dart';

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
          CustomIcon(
            icon: Icons.search_rounded,
            color: AppColors.whiteColor,
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => SearchView()));
            },
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 40);
}
