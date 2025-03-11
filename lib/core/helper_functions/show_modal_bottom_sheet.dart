import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

customShowModalBottomSheet({
  required BuildContext context,
  required Widget child,
}) {
  showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: AppColors.transparent,
    context: context,
    builder: (context) {
      return child;
    },
  );
}
