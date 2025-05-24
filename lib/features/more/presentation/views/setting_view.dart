import 'package:flutter/material.dart';
import 'package:smile_simulation/features/more/presentation/views/widgets/setting_view_body.dart';
import 'package:smile_simulation/generated/l10n.dart';

import '../../../../core/widgets/custom_auth_appbar.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  static const routeName = 'setting';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        context,
        title: S.of(context).settings,
        isBack: true,
      ),
      body: SettingViewBody(),
    );
  }
}
