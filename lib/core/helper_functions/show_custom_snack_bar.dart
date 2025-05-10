import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> customShowSnackBar(
  BuildContext context,
  String message,
) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message), backgroundColor: AppColors.redColor),
  );
}
