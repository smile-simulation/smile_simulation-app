import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/generated/l10n.dart';

import '../../../../data/models/advices_category/advices_category.dart';
import '../../../managers/cubits/advices_cubit/advices_cubit.dart';
import 'categories_list_view.dart';
import '../../widgets_skeletons/catogory_item_skeleton.dart';
import '../../widgets/custom_display_error_message.dart';
import 'empty_categories_list_view.dart';

class CategoriesListViewBuilder extends StatelessWidget {
  const CategoriesListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final advicesCubit = context.read<AdvicesCubit>();
    return BlocBuilder<AdvicesCubit, AdvicesState>(
      builder: (context, state) {
        if (state is GetCategoriesAndAdvicesFail ||
            state is AdvicesFetchSuccessWithCategoriesError) {
          final errorMessage = _getErrorMessageFromState(state);
          return CustomDisplayErrorMessage(errorMessage: errorMessage);
        } else if (state is GetCategoriesAndAdvicesLoading) {
          return ListView.separated(
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, __) => const CategoryItemCardSkeleton(),
            itemCount: 6,
          );
        } else if (state is GetCategoriesAndAdvicesSuccess ||
            state is CategoriesFetchSuccessWithAdvicesError) {
          List<AdvicesCategory> advicesCategories = _getCategoriesFromState(
            state,
            advicesCubit,
          );
          return advicesCategories.isEmpty
              ? EmptyListView(message: S.of(context).noCategoriesAdvicesExist)
              : CategoriesListView(advicesCategories: advicesCategories);
        } else {
          return const Center(child: Text("Something went wrong"));
        }
      },
    );
  }

  String _getErrorMessageFromState(AdvicesState state) {
    return state is GetCategoriesAndAdvicesFail
        ? state.gettingCategoriesErrorMsg
        : (state as AdvicesFetchSuccessWithCategoriesError)
            .gettingCategoriesErrorMsg!;
  }

  List<AdvicesCategory> _getCategoriesFromState(
    AdvicesState state,
    AdvicesCubit advicesCubit,
  ) {
    List<AdvicesCategory> advicesCategories = [];
    if (state is GetCategoriesAndAdvicesSuccess) {
      advicesCategories = advicesCubit.getAdvicesCategorySubset(
        advicesCategoriesAll: state.categories,
      );
    } else if (state is CategoriesFetchSuccessWithAdvicesError) {
      advicesCategories = advicesCubit.getAdvicesCategorySubset(
        advicesCategoriesAll: state.advicesCategory,
      );
    }
    return advicesCategories;
  }
}
