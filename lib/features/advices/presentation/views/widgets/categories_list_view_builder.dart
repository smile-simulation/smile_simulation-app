import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/advices_category/advices_category.dart';
import '../../managers/cubit/advices_cubit.dart';
import 'categories_list_view.dart';
import 'widgets_skeletons/catogory_item_skeleton.dart';

class CategoriesListViewBuilder extends StatefulWidget {
  const CategoriesListViewBuilder({super.key});

  @override
  State<CategoriesListViewBuilder> createState() =>
      _CategoriesListViewBuilderState();
}

class _CategoriesListViewBuilderState extends State<CategoriesListViewBuilder> {
  @override
  void initState() {
    context.read<AdvicesCubit>().getAllAdvicesCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvicesCubit, AdvicesState>(
      builder: (context, state) {
        List<AdvicesCategory> advicesCategories =
            context.read<AdvicesCubit>().advicesCategories;
        if (state is GetAllAdvicesCategoriesFail) {
          return Center(child: SizedBox(child: Text("Error")));
        } else if (state is GetAllAdvicesCategoriesLoading ||
            advicesCategories.isEmpty) {
          log("hi");
          return ListView.separated(
            separatorBuilder: (context, index) => SizedBox(width: 16),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CategoryItemCardSkeleton();
            },
            itemCount: 6,
          );
        } else {
          return CategoriesListView(advicesCategories: advicesCategories);
        }
      },
    );
  }
}
