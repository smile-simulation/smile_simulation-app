import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

import 'custom_flexible_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [CustomFlexibleAppBar()];
      },
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor ,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(45),
            topRight: Radius.circular(45),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text('datas', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
