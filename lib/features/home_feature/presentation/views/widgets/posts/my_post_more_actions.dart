import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/widgets/custom_bottom_sheet.dart';
import 'package:smile_simulation/core/widgets/user_details_list_tile.dart';
import 'package:smile_simulation/generated/l10n.dart';

class MyPostMoreActionsBottomSheet extends StatelessWidget {
  const MyPostMoreActionsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      bottomSheetHeight: MediaQuery.of(context).size.height / 5,
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomListTile(
              title: S.of(context).editPost,
              icon: Icons.edit,
              onTap: () {},
            ),
            SizedBox(height: 16),
            CustomListTile(
              title: S.of(context).deletePost,
              icon: Icons.delete_outline,
              iconColor: AppColors.redColor,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
