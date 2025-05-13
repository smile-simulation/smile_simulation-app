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


    return CustomBodyScreen(child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: CategoryAdvicesListViewBuilder(),
    ));
  }
}
