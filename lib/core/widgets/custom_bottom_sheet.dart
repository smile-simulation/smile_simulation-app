import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/widgets/bottom_sheet_handle.dart';

class CustomBottomSheet extends StatelessWidget {
  final Widget child;
  final double? bottomSheetHeight;
  final double? heldlerWidth;
  const CustomBottomSheet({
    super.key,
    required this.child,
    this.bottomSheetHeight,
    this.heldlerWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: double.infinity,
      height: bottomSheetHeight ?? MediaQuery.of(context).size.height / 3,
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 22),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(45),
          topRight: Radius.circular(45),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomSheetHandle(width: MediaQuery.of(context).size.width / 6),
          const SizedBox(height: 8),
          Expanded(child: SingleChildScrollView(child: child)),
        ],
      ),
    );
  }
}
