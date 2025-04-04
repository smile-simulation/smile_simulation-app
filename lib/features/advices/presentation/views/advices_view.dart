import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/helper_functions/get_it.dart';
import 'package:smile_simulation/features/advices/data/repos/advices_repo/advices_repo.dart';
import 'package:smile_simulation/features/advices/presentation/managers/cubits/advices_cubit/advices_cubit.dart';

import 'widgets/advices_view_body.dart';

class AdvicesView extends StatelessWidget {
  const AdvicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdvicesCubit(getIt.get<AdvicesRepo>()),
      child: AdvicesViewBody(),
    );
  }
}
