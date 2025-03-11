import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

import 'add_comment_form_field.dart';
import 'comments_list_view_builder.dart';

class CustomCommentsBottomSheet extends StatelessWidget {
  const CustomCommentsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final bool isKeyboardActive = keyboardHeight > 0;
    final double height =
        MediaQuery.of(context).size.height * (isKeyboardActive ? 0.6 : 0.7);
    return AnimatedPadding(
      duration: Duration(milliseconds: 80),
      padding: EdgeInsets.only(bottom: isKeyboardActive ? keyboardHeight : 0),
      child: Directionality(
        textDirection: TextDirection.rtl,
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
              SizedBox(height: 40),
              Expanded(child: CommentsListViewBuilder()),
              AddCommentFormField(),
            ],
          ),
        ),
      ),
    );
  }
}
