import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/generated/l10n.dart';

import '../../../../../../constant.dart';
import '../../../../../../core/database/cache/cache_helper.dart';
import '../../../../../../generated/assets.dart';
import '../../../cubits/comments_cubit/comments_cubit.dart';

class AddCommentFormField extends StatelessWidget {
  const AddCommentFormField({super.key, this.markEdited});
  final Function()? markEdited;
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
          CircleAvatar(
            backgroundImage:
                CacheHelper().getMap(key: userData)!['image'] != null
                    ? NetworkImage(
                      CacheHelper().getMap(key: userData)!['image'],
                    )
                    : const AssetImage(Assets.imagesUser),
            radius: 20,
          ),
          SizedBox(width: 8), // تباعد بين الصورة ومربع النص
          Expanded(
            child: TextFormField(
              controller: context.read<CommentsCubit>().commentController,
              focusNode:
                  context.read<CommentsCubit>().CommentTextFieldCtrlFocusNode,
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
            onPressed: () async {
              await context.read<CommentsCubit>().addComment(
                onError: (txt) {
                  MotionToast.error(
                    description: Text(txt),
                    toastAlignment: Alignment.topCenter,
                  ).show(context);
                },
              );
              context.read<CommentsCubit>().commentAdded = true;
              if (markEdited != null) {
                markEdited!();
              }
            },
          ),
        ],
      ),
    );
  }
}
