
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../managers/cubit/advices_cubit.dart';
import 'custom_advice.dart';

class AdvicesListView extends StatelessWidget {
  const AdvicesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return CustomAdvice(
          advice: context.read<AdvicesCubit>().advices[index],
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 16),
      itemCount: 5,
    );
  }
}
