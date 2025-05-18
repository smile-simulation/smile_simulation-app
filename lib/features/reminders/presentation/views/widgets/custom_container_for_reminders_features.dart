
import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

class CustomContainerForReminderFeature extends StatelessWidget {
  const CustomContainerForReminderFeature({
    super.key, required this.widget,  this.color= AppColors.veryLightGreyColor,
  });
final Widget widget;
final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8,
      ),
      child: Container(
        width: double.infinity,
        height: 150,
      
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
          boxShadow:  [
            BoxShadow(
              color:Colors.black12 ,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
      child: widget,),
    );
  }
}
