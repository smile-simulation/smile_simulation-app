import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/widgets/home_view_body.dart';

import 'widgets/custom_bottom_navigation_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(),

        extendBodyBehindAppBar: true,
        backgroundColor: AppColors.primaryColor,
        body: HomeViewBody(),
      ),
    );
  }
}
