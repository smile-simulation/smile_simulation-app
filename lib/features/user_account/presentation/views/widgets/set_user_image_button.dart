import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/widgets/bottom_navigation_bar/bottom_nvaigation_view.dart';
import 'package:smile_simulation/features/user_account/presentation/managers/set_user_account_image/set_user_accoun_image_cubit.dart';

import '../user_account_view.dart';

class SetUserImageButton extends StatelessWidget {
  const SetUserImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SetUserAccounImageCubit, SetUserAccounImageState>(
      listener: (context, state) {
        if (state is SetUserAccounImageSuccess) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => BottomNavigationView()),
            (route) => false, // امسح كل اللي قبل
          );
          Navigator.pushNamed(
            context,
            UserAccountView.routeName,
            arguments: true,
          );
        }
      },
      child: Positioned(
        bottom: 0,
        right: 0,
        child: IconButton(
          style: IconButton.styleFrom(
            backgroundColor: AppColors.whiteColor,
            foregroundColor: AppColors.primaryColor,
          ),
          onPressed: () {
            context.read<SetUserAccounImageCubit>().setUserAccountImage();
          },
          icon: Icon(Icons.add),
        ),
      ),
    );
  }
}
