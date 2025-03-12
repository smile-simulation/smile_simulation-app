import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/features/search_feature/presentation/views/widgets/custom_search_record.dart';

class SearchRecordListView extends StatelessWidget {
  const SearchRecordListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
     
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.lightGreyColor),
              borderRadius: BorderRadius.circular(8),
            ),
            child: CustomSearchRecord(),
          ),
        );
      },
    );
  }
}

