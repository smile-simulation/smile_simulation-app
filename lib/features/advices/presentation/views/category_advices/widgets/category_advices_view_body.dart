import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/widgets/custom_app_bar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/generated/l10n.dart';

import '../../../managers/cubits/category_advices/category_advices_cubit.dart';
import 'category_advices_list_view_builder.dart';

class CategoryAdvicesViewBody extends StatelessWidget {
  const CategoryAdvicesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryName =
        context.read<CategoryAdvicesCubit>().category.name ??
        S.of(context).noAdvicesExist;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomAppBar(title: categoryName, icon: Icons.arrow_back),
        Expanded(
          child: CustomBodyScreen(child: CategoryAdvicesListViewBuilder()),
        ),
      ],
    );
  }
}
