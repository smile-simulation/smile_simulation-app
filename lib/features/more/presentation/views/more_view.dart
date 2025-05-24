import 'package:flutter/material.dart';
import 'package:smile_simulation/features/more/presentation/views/widgets/more_view_body.dart';

import '../../../../core/widgets/custom_auth_appbar.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, title: "المزيد", isBack: false),
      body: MoreViewBody(),
    );
  }
}
