import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/features/search_feature/presentation/views/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: Text('البحث'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.whiteColor,
      ),
      body: SearchViewBody(), //PostViewBody(),
    );
  }
}
