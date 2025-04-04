import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/api/dio_consumer.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/features/advices/data/models/advices_category/advices_category.dart';
import 'package:smile_simulation/features/advices/data/repos/advices_repo_impl.dart';
import 'package:smile_simulation/features/advices/presentation/managers/cubit/advices_cubit.dart';
import 'package:smile_simulation/features/advices/presentation/views/widgets/category_item_card.dart';
import 'package:smile_simulation/generated/l10n.dart';

class AdvicesCategoriesSection extends StatelessWidget {
  const AdvicesCategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.of(context).advicesCategories,
                style: AppTextStyles.headline2(context),
              ),
              InkWell(
                onTap: () {
                  AdvicesRepoImpl(
                    dioConsumer: DioConsumer(dio: Dio()),
                  ).getAllAdvicesCategories();
                },
                child: Text(
                  S.of(context).showAll,
                  style: AppTextStyles.subTitle2(
                    context,
                  ).copyWith(color: AppColors.primaryColor),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        SizedBox(height: 212, child: CategoriesListViewBuilder()),
      ],
    );
  }
}

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
        if (state is GetAllAdvicesCategoriesFail) {
          return Center(child: SizedBox(child: Text("Error")));
        } else if (state is GetAllAdvicesCategoriesLoading) {
          return Center(child: CircularProgressIndicator());
        } else {
          log(context.read<AdvicesCubit>().advicesCategories.toString());
          return CategoriesListView(
            // advicesCategories: [],
            advicesCategories: context.read<AdvicesCubit>().advicesCategories,
          );
        }
      },
    );
  }
}

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key, required this.advicesCategories});
  final List<AdvicesCategory> advicesCategories;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) {
        if (advicesCategories.isEmpty) {
          return Text("No Categories");
        } else {
          return CategoryItemCard(category: advicesCategories[index]);
        }
      },
      separatorBuilder: (context, index) => SizedBox(width: 16),
      itemCount: advicesCategories.length,
    );
  }
}
