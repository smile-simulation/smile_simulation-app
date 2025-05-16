import 'package:flutter/material.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/features/advices/presentation/views/advices_home/widgets/advices_list_view.dart';

import '../../../../data/models/advice/advice.dart';

class AllAdvicesViewBody extends StatelessWidget {
  const AllAdvicesViewBody({super.key, required this.advices});
  final List<Advice> advices;
  @override
  Widget build(BuildContext context) {
    return CustomBodyScreen(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: AdvicesListView(
          advices: advices,
          physics: BouncingScrollPhysics(),
          shrinkWrap: false,
        ),
      ),
    );
  }
}
