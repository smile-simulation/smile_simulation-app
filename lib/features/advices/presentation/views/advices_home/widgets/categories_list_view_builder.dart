import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/generated/l10n.dart';

import '../../../../data/models/advices_category/advices_category.dart';
import '../../../managers/cubits/advices_cubit/advices_cubit.dart';
import 'categories_list_view.dart';
import '../../widgets_skeletons/catogory_item_skeleton.dart';

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
        List<AdvicesCategory> advicesCategoriesSubset =
            context.read<AdvicesCubit>().getAdvicesCategorySubset();
        if (state is GetAllAdvicesCategoriesFail) {
          return Center(child: SizedBox(child: Text(state.errorMsg)));
        } else if (state is GetAllAdvicesCategoriesSuccess &&
            advicesCategoriesSubset.isEmpty) {
          return Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 132,
            decoration: BoxDecoration(color: AppColors.whiteColor),
            child: Text(S.of(context).noCategoriesAdvicesExist),
          );
        } else if (state is GetAllAdvicesCategoriesLoading ||
            advicesCategoriesSubset.isEmpty) {
          return ListView.separated(
            separatorBuilder: (context, index) => SizedBox(width: 16),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CategoryItemCardSkeleton();
            },
            itemCount: 6,
          );
        } else {
          return Container(
            alignment: Alignment.center,
            child: CategoriesListView(
              advicesCategories: advicesCategoriesSubset,
            ),
          );
        }
      },
    );
  }
}
