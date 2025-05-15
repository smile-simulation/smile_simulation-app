import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_button.dart';
import 'package:smile_simulation/features/home_feature/presentation/cubits/add_post_cubit/add_post_cubit.dart';
import 'package:smile_simulation/generated/l10n.dart';

import '../../../../../../constant.dart';
import '../../../../../../core/database/cache/cache_helper.dart';
import '../../../../../../generated/assets.dart';
import 'add_post_text_field.dart';

class CreatePostViewBody extends StatelessWidget {
  const CreatePostViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBodyScreen(
      child: Column(
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
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
              SizedBox(width: 12),
              Text(
                S.of(context).mohamedHamed,
                overflow: TextOverflow.ellipsis,

                style: AppTextStyles.headline2(
                  context,
                ).copyWith(color: AppColors.blackColor),
              ),
            ],
          ),
          SizedBox(height: 30),
          AddPostTextField(),
          Spacer(),
          SizedBox(height: 30),
          CustomButton(
            // text: ,
            // buttonColor: AppColors.primaryColor,
            // textColor: AppColors.whiteColor,
            onPressed: () {
              context.read<AddPostCubit>().addPost();
              // Navigator.of(
              //   context,
              // ).push(MaterialPageRoute(builder: (context) => EditPostView()));
            },
            title: S.of(context).publish,
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
