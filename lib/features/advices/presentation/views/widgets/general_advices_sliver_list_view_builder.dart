import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/features/advices/presentation/managers/cubit/advices_cubit.dart';

import 'advices_list_view.dart';
import 'custom_advice.dart';

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
        if (state is GetAdvicesFail) {
          return Center(child: SizedBox(child: Text("Error")));
        } else if (state is GetAdvicesLoading) {
          return Center(child: CircularProgressIndicator());
        } else {
          return AdvicesListView();
        }
      },
    );
  }
}
