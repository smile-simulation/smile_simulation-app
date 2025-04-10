import 'package:flutter/material.dart';
import 'package:smile_simulation/core/widgets/custom_app_bar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/features/advices/presentation/views/advices_home/widgets/advices_list_view.dart';
import 'package:smile_simulation/generated/l10n.dart';

import '../../../../data/models/advice/advice.dart';

class AllAdvicesViewBody extends StatelessWidget {
  const AllAdvicesViewBody({super.key, required this.advices});
  final List<Advice> advices;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomAppBar(title: S.of(context).advices, icon: Icons.arrow_back),
        Expanded(
          child: CustomBodyScreen(
            child: AdvicesListView(
              advices: advices,
              physics: BouncingScrollPhysics(),
              shrinkWrap: false,
            ),
          ),
        ),
      ],
    );
  }
}
