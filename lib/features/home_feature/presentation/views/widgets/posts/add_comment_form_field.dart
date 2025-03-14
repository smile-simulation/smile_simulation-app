import 'package:flutter/material.dart';
import 'package:smile_simulation/core/services/navigations.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/widgets/current_user_circle_image.dart';
import 'package:smile_simulation/features/user_account/presentation/views/user_account_view.dart';
import 'package:smile_simulation/generated/l10n.dart';

class AddCommentFormField extends StatelessWidget {
  const AddCommentFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: EdgeInsets.symmetric(horizontal: 8),
      margin: EdgeInsets.all(6),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: AppColors.greyColor),
      ),
      child: Row(
        children: [
          CurrentUserCircleImage(
            color: AppColors.primaryColor,
            borderWidth: 4,
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return UserAccountView(currentUser: false,);
              //     },
              //   ),
              // );
              navigateTo(context, UserAccountView(currentUser: false));
            },
          ),
          SizedBox(width: 8), // تباعد بين الصورة ومربع النص
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: '${S.of(context).comment} ...',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 10),
              ),
              style: TextStyle(fontSize: 16),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.send,
              color: AppColors.primaryColor,
              // textDirection: TextDirection.rtl,
              size: 28,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
