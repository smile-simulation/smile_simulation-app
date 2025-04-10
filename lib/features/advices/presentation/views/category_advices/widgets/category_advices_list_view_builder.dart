import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/generated/l10n.dart';

import '../../../managers/cubits/category_advices/category_advices_cubit.dart';
import '../../advices_home/widgets/advices_list_view.dart';
import '../../widgets_skeletons/general_advice_skeleton.dart';

class CategoryAdvicesListViewBuilder extends StatelessWidget {
  const CategoryAdvicesListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryAdvicesCubit, CategoryAdvicesState>(
      builder: (context, state) {
        if (state is GetAdvicesByCategoryIdLoading) {
          return ListView.separated(
            itemBuilder: (context, index) {
              return GeneralAdviceSkeleton();
            },
            itemCount: 8,
            separatorBuilder: (context, index) {
              return SizedBox(height: 12);
            },
          );
        } else if (state is GetAdvicesByCategoryIdSuccess) {
          if (state.categoryAdvices.isEmpty) {
            return Center(child: Text(S.of(context).noAdvicesExist));
          } else {
            return AdvicesListView(
              advices: state.categoryAdvices,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: false,
            );
          }
        } else {
          return Center(child: Text("Something went wrong"));
        }
      },
    );
  }
}
