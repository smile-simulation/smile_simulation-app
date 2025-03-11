import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

class CustomCommentsBottomSheet extends StatelessWidget {
  const CustomCommentsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final bool isKeyboardActive = keyboardHeight > 0;
    final double height = MediaQuery.of(context).size.height * 0.5;
    return AnimatedPadding(
      duration: Duration(milliseconds: 120),
      padding: EdgeInsets.only(bottom: isKeyboardActive ? keyboardHeight : 0),
      child: Container(
        width: double.infinity,
        height: height,
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
            Text('comments'),
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
