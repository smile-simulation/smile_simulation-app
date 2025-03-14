import 'package:flutter/material.dart';
import 'package:smile_simulation/core/helper_functions/custom_body_screen.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/features/search_feature/presentation/views/widgets/custom_search_box.dart';
import 'package:smile_simulation/features/search_feature/presentation/views/widgets/search_record_list_view.dart';
import 'package:smile_simulation/generated/l10n.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: CustomSearchBox(),
        ),
        SizedBox(height: 5),
        Expanded(
          child: CustomBodyScreen(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    S.of(context).searchRecord,
                    style: AppTextStyles.heading2(context).copyWith(color: AppColors.blackColor),
                  ),
                ),
                Expanded(child: SearchRecordListView()),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
