import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/widgets/custom_app_bar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/core/widgets/sliver_sized_box.dart';
import 'package:smile_simulation/features/advices/presentation/managers/cubits/advices_cubit/advices_cubit.dart';
import 'package:smile_simulation/generated/l10n.dart';

import 'advices_categories_section.dart';
import 'general_advices_section.dart';
import 'todays_advice_section.dart';

class AdvicesViewBody extends StatefulWidget {
  const AdvicesViewBody({super.key});

  @override
  State<AdvicesViewBody> createState() => _AdvicesViewBodyState();
}

class _AdvicesViewBodyState extends State<AdvicesViewBody> {
  @override
  void initState() {
    context.read<AdvicesCubit>().getCategoriesAndAdvices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(title: S.of(context).advices),
        Expanded(
          child: CustomBodyScreen(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: TodaysAdviceSection()),
                SliverSizedBox(height: 24),
                SliverToBoxAdapter(child: AdvicesCategoriesSection()),
                SliverSizedBox(height: 24),
                SliverToBoxAdapter(child: GeneralAdvicesSection()),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
