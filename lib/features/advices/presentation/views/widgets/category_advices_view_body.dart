import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/widgets/custom_app_bar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/features/advices/presentation/managers/cubits/category_advices/category_advices_cubit.dart';
import 'package:smile_simulation/generated/l10n.dart';

class CategoryAdvicesViewBody extends StatelessWidget {
  const CategoryAdvicesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<CategoryAdvicesCubit, CategoryAdvicesState>(
          builder: (context, state) {
            return Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomAppBar(
                    title:
                        context.read<CategoryAdvicesCubit>().category.name ??
                        S.of(context).noAdvicesExist,
                    icon: Icons.arrow_back,
                  ),
                  Expanded(child: CustomBodyScreen(child: Text("helo"))),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
