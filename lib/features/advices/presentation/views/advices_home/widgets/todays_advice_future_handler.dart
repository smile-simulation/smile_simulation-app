import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/advice/advice.dart';
import '../../../managers/cubits/advices_cubit/advices_cubit.dart';
import '../../widgets_skeletons/todays_advice_skeleton.dart';
import 'custom_todays_advice.dart';

class TodaysAdviceFutureHandler extends StatelessWidget {
  const TodaysAdviceFutureHandler({super.key, required this.advices});
  final List<Advice> advices;

  @override
  Widget build(BuildContext context) {
    final advicesCubit = context.read<AdvicesCubit>();

    return FutureBuilder(
      future: advicesCubit.getTodaysAdvice(myAdvices: advices),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // return  Container();
          return const TodaysAdviceSkeleton();
        } else if (snapshot.hasError) {
          return const Center(child: Text("Error loading today's advice"));
        } else {
          return CustomTodaysAdvice(
            advice:
                advicesCubit.toDaysAdvice ??
                Advice(
                  image:
                      'http://smilesimulation.runasp.net/Advice/93bae9f2-5e5b-47a7-91ba-b65bf4193fecimageProfile.jpeg',
                ),
          );
        }
      },
    );
  }
}
