import 'package:flutter/material.dart';

import 'custom_flexible_app_bar.dart';
import 'home_view_body_content.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [CustomFlexibleAppBar()];
      },
      body: HomeViewBodyContent(),
    );
  }
}
