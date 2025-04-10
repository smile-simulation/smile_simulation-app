import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../managers/cubits/category_advices/category_advices_cubit.dart';
import 'widgets/category_advices_view_body.dart';

class CategoryAdvicesView extends StatefulWidget {
  const CategoryAdvicesView({super.key});
  static const routeName = 'categoryAdvicesView';

  @override
  State<CategoryAdvicesView> createState() => _CategoryAdvicesViewState();
}

class _CategoryAdvicesViewState extends State<CategoryAdvicesView> {
  @override
  void initState() {
    super.initState();
    context.read<CategoryAdvicesCubit>().getAdvicesByCategoryId(
      id: context.read<CategoryAdvicesCubit>().category.id!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CategoryAdvicesViewBody());
  }
}
