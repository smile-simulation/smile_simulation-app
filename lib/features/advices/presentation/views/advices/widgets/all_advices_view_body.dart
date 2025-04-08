import 'package:flutter/material.dart';
import 'package:smile_simulation/core/widgets/custom_app_bar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/generated/l10n.dart';

class AllAdvicesViewBody extends StatelessWidget {
  const AllAdvicesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomAppBar(title: S.of(context).advices, icon: Icons.arrow_back),
        Expanded(child: CustomBodyScreen(child: Container())),
      ],
    );
  }
}
