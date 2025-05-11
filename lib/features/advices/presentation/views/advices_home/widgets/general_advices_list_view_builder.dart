import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/generated/l10n.dart';

import '../../../../data/models/advice/advice.dart';
import '../../../managers/cubits/advices_cubit/advices_cubit.dart';
import '../../widgets/custom_display_error_message.dart';
import 'empty_list_view.dart';
import 'general_advices_list_view.dart';
import '../../widgets_skeletons/general_advice_skeleton.dart';

class GeneralAdvicesListViewBuilder extends StatelessWidget {
  const GeneralAdvicesListViewBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    AdvicesCubit advicesCubit = context.read<AdvicesCubit>();
    return BlocBuilder<AdvicesCubit, AdvicesState>(
      builder: (context, state) {
        log(state.toString());
        if (state is CategoriesFetchSuccessWithAdvicesError ||
            state is GetAllAdvicesCategoriesSuccess) {
          return CustomDisplayErrorMessage(
            errorMessage: _getErrorMessageFromState(state),
          );
        } else if (state is GetCategoriesAndAdvicesSuccess ||
            state is AdvicesFetchSuccessWithCategoriesError) {
          List<Advice> advices = _getAdvicesFromState(state, advicesCubit);
          if (advices.isEmpty) {
            return EmptyListView(message: S.of(context).noAdvicesExist);
          } else {
            log(advices.toString());
            return GeneralAdvicesListView(advices: advices);
          }
        } else if (state is GetCategoriesAndAdvicesLoading) {
          return ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GeneralAdviceSkeleton();
            },
            separatorBuilder: (context, index) => SizedBox(height: 12),
            itemCount: 5,
          );
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
