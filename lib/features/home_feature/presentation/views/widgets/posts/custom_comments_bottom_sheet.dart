import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

class CustomCommentsBottomSheet extends StatelessWidget {
  const CustomCommentsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final bool isKeyboardActive = keyboardHeight > 0;
    final double height = MediaQuery.of(context).size.height * 0.7;
    return AnimatedPadding(
      duration: Duration(milliseconds: 80),
      padding: EdgeInsets.only(bottom: isKeyboardActive ? keyboardHeight : 0),
      child: Container(
        width: double.infinity,
        height: height,
        padding: EdgeInsets.only(bottom: 22, left: 6, right: 6, top: 12),
        decoration: BoxDecoration(
          color: AppColors.lightGreyColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(45),
            topRight: Radius.circular(45),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 3,
              height: 6,
              decoration: BoxDecoration(
                color: AppColors.greyLightColor,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            Spacer(),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Add a comment...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
