import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/widgets/custom_app_bar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/features/advices/data/dummy_data/json_advices.dart';
import 'package:smile_simulation/features/advices/data/models/advice/advice.dart';
import 'package:smile_simulation/generated/l10n.dart';

import '../../../managers/cubits/category_advices/category_advices_cubit.dart';
import '../../advices_home/widgets/advices_list_view.dart';

class CategoryAdvicesViewBody extends StatelessWidget {
  const CategoryAdvicesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryName =
        context.read<CategoryAdvicesCubit>().category.name ??
        S.of(context).noAdvicesExist;

    final advices =
        jsonAdvices.map((advice) => Advice.fromJson(advice)).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomAppBar(title: categoryName, icon: Icons.arrow_back),
        Expanded(
          child: CustomBodyScreen(
            child: AdvicesListView(
              advices: advices,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: false,
            ),
          ),
        ),
      ],
    );
  }
}
