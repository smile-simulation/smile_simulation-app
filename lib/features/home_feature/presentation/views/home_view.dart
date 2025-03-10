import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.primaryColor,
      body: const SafeArea(
        top: false,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: HomeViewBody(),
        ),
      ),
    );
  }
}
