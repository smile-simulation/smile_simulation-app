import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(color: AppColors.primaryColor),
              child: Text("Flexible Space"),
            ),
            title: Text("TItle"),
          ),
          SliverList.builder(
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: AppColors.grayHeavyText_1Color,
                ),
              );
            },
            itemCount: 25,
          ),
        ],
      ),
    );
  }
}
