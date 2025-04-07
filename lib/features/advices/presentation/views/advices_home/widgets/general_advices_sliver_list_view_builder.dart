import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/advice/advice.dart';
import '../../../managers/cubits/advices_cubit/advices_cubit.dart';
import 'advices_list_view.dart';

class GeneralAdvicesSliverListViewBuilder extends StatefulWidget {
  const GeneralAdvicesSliverListViewBuilder({super.key});

  @override
  State<GeneralAdvicesSliverListViewBuilder> createState() =>
      _GeneralAdvicesSliverListViewBuilderState();
}

class _GeneralAdvicesSliverListViewBuilderState
    extends State<GeneralAdvicesSliverListViewBuilder> {
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
        List<Advice> advices = context.read<AdvicesCubit>().advices;
        if (state is GetAdvicesFail) {
          return Center(child: SizedBox(child: Text("Error")));
        } else if (state is GetAdvicesLoading || advices.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else {
          return AdvicesListView(advices: advices);
        }
      },
    );
  }
}
