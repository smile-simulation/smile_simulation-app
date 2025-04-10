import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

class EmptyListView extends StatelessWidget {
  const EmptyListView({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 132,
      decoration: const BoxDecoration(color: AppColors.whiteColor),
      child: Text(message),
    );
  }
}
