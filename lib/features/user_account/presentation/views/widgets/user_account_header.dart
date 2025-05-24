import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/helper_functions/get_it.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/features/user_account/presentation/managers/set_user_account_image/set_user_accoun_image_cubit.dart';
import '../../../data/repos/set_user_account_image_repo/set_user_account_image_repo_impl.dart';
import 'set_user_image_button.dart';
import 'user_account_image_builder.dart';

class UserAccountHeader extends StatelessWidget {
  const UserAccountHeader({
    super.key,
    required this.currentUser,
    required this.userName,
    required this.userImage,
  });
  final bool currentUser;
  final String userName;
  final String? userImage;
  @override
  Widget build(BuildContext context) {
    log("this user image: $userImage");
    return BlocProvider(
      create: (context) => SetUserAccounImageCubit(getIt<SetUserAccountImageRepoImpl>()),
      child: SizedBox(
        height: 164 + kToolbarHeight + 40,
        child: Column(
          children: [
            SizedBox(height: kToolbarHeight + 40),
            Stack(
              children: [
                UserAccountImageBuilder(userImage: userImage),
                Visibility(visible: currentUser, child: SetUserImageButton()),
              ],
            ),
            Text(
              userName,
              style: AppTextStyles.headline2(
                context,
              ).copyWith(color: AppColors.whiteColor),
            ),
          ],
        ),
      ),
    );
  }
}
