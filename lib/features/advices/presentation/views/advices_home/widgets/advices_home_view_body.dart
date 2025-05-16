import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/core/widgets/sliver_sized_box.dart';

import '../../../managers/cubits/advices_cubit/advices_cubit.dart';
import 'advices_categories_section.dart';
import 'general_advices_section.dart';
import 'todays_advice_section.dart';

class AdvicesHomeViewBody extends StatefulWidget {
  const AdvicesHomeViewBody({super.key});

  @override
  State<AdvicesHomeViewBody> createState() => _AdvicesHomeViewBodyState();
}

class _AdvicesHomeViewBodyState extends State<AdvicesHomeViewBody> {
  @override
  void initState() {
    context.read<AdvicesCubit>().getCategoriesAndAdvices();
    super.initState();
  }

  bool dataGot = false;
  @override
  Widget build(BuildContext context) {
    return CustomBodyScreen(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TodaysAdviceSection(),
            ),
          ),
          SliverSizedBox(height: 16),
          SliverToBoxAdapter(child: AdvicesCategoriesSection()),
          SliverToBoxAdapter(child: GeneralAdvicesSection()),
        ],
      ),
    );
  }
}
