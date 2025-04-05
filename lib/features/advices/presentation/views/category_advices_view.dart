import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/features/advices/presentation/managers/cubits/category_advices/category_advices_cubit.dart';

import 'widgets/category_advices_view_body.dart';

class CategoryAdvicesView extends StatelessWidget {
  const CategoryAdvicesView({super.key});
  static const routeName = 'categoryAdvicesView';

  @override
  Widget build(BuildContext context) {
    log(context.read<CategoryAdvicesCubit>().category.toString());
    return Scaffold(body: CategoryAdvicesViewBody());
  }
}
