import 'package:flutter/material.dart';
import 'package:smile_simulation/features/more/presentation/views/widgets/more_view_body.dart';
import 'package:smile_simulation/generated/l10n.dart';

import '../../../../core/widgets/custom_auth_appbar.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, title: S.of(context).more, isBack: false),
      body: MoreViewBody(),
    );
  }
}
