import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/generated/l10n.dart';

import '../../../data/models/advice/advice.dart';
import '../../managers/cubits/advices_cubit/advices_cubit.dart';
import 'general_advices_list_view.dart';
import 'widgets_skeletons/general_advice_skeleton.dart';

class GeneralAdvicesListViewBuilder extends StatefulWidget {
  const GeneralAdvicesListViewBuilder({super.key});

  @override
  State<GeneralAdvicesListViewBuilder> createState() =>
      _GeneralAdvicesListViewBuilderState();
}

class _GeneralAdvicesListViewBuilderState
    extends State<GeneralAdvicesListViewBuilder> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<AdvicesCubit>(context).getAdvices();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvicesCubit, AdvicesState>(
      builder: (context, state) {
        List<Advice> advices = context.read<AdvicesCubit>().getAdvicesSubset();
        if (state is GetAdvicesFail) {
          return Center(child: SizedBox(child: Text(state.errorMsg)));
        } else if (state is GetAdvicesSuccess && advices.isEmpty) {
          return Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 132,
            decoration: BoxDecoration(color: AppColors.whiteColor),
            child: Text(S.of(context).noAdvicesExist),
          );
        } else if (state is GetAdvicesLoading || advices.isEmpty) {
          return ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GeneralAdviceSkeleton();
            },
            separatorBuilder: (context, index) => SizedBox(height: 16),
            itemCount: 5,
          );
        } else {
          return GeneralAdvicesListView(advices: advices);
        }
      },
    );
  }
}
