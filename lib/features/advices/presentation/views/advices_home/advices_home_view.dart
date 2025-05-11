import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/helper_functions/get_it.dart';

import '../../../../../core/widgets/custom_auth_appbar.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/repos/advices_repo/advices_repo.dart';
import '../../managers/cubits/advices_cubit/advices_cubit.dart';
import 'widgets/advices_home_view_body.dart';

class AdvicesHomeView extends StatelessWidget {
  const AdvicesHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdvicesCubit(getIt.get<AdvicesRepo>()),
      child: Scaffold(
          appBar: customAppbar(context, title: S.of(context).advices),
          body: AdvicesHomeViewBody()),
    );
  }
}
