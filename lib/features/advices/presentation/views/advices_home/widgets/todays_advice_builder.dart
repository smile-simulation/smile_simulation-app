import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/features/advices/data/models/advice/advice.dart';

import '../../../managers/cubits/advices_cubit/advices_cubit.dart';
import '../../widgets/custom_display_error_message.dart';
import '../../widgets_skeletons/todays_advice_skeleton.dart';
import 'todays_advice_future_handler.dart';

class TodaysAdviceBuilder extends StatelessWidget {
  const TodaysAdviceBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    AdvicesCubit advicesCubit = context.read<AdvicesCubit>();
    return BlocBuilder<AdvicesCubit, AdvicesState>(
      builder: (context, state) {
        if (state is CategoriesFetchSuccessWithAdvicesError ||
            state is GetAllAdvicesCategoriesSuccess) {
          return CustomDisplayErrorMessage(
            errorMessage: _getErrorMessageFromState(state),
          );
        } else if (state is GetCategoriesAndAdvicesSuccess ||
            state is AdvicesFetchSuccessWithCategoriesError) {
          List<Advice> advices = _getAdvicesFromState(state, advicesCubit);

          return TodaysAdviceFutureHandler(advices: advices);
        } else if (state is GetCategoriesAndAdvicesLoading) {
          return TodaysAdviceSkeleton();
        } else {
          return Center(child: Text("un handled issue"));
        }
      },
    );
  }

  String _getErrorMessageFromState(AdvicesState state) {
    return state is GetCategoriesAndAdvicesFail
        ? state.gettingCategoriesErrorMsg
        : (state as CategoriesFetchSuccessWithAdvicesError)
            .gettingAdvicesErrorMsg!;
  }

  List<Advice> _getAdvicesFromState(
    AdvicesState state,
    AdvicesCubit advicesCubit,
  ) {
    List<Advice> advices = [];
    if (state is GetCategoriesAndAdvicesSuccess) {
      advices = advicesCubit.getAdvicesSubset(advicesAll: state.advices);
    } else if (state is AdvicesFetchSuccessWithCategoriesError) {
      advices = advicesCubit.getAdvicesSubset(advicesAll: state.advices);
    }
    return advices;
  }
}
