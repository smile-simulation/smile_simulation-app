import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

customShowModalBottomSheet({
  required BuildContext context,
  required Widget Function(void Function()) builder,
  Future<void> Function(bool edited) oncomplete = _emptyCallback,
}) {
  bool edited = false;

  void markEdited() {
    edited = true;
  }

  showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: AppColors.transparent,
    context: context,
    builder: (context) => builder(markEdited),
  ).whenComplete(() {
    oncomplete(edited);
  });
}

Future<void> _emptyCallback(bool _) async {}
