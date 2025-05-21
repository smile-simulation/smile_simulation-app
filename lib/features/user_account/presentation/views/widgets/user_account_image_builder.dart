import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/features/user_account/presentation/managers/set_user_account_image/set_user_accoun_image_cubit.dart';

import 'user_account_image.dart';

class UserAccountImageBuilder extends StatelessWidget {
  const UserAccountImageBuilder({super.key, required this.userImage});

  final String? userImage;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SetUserAccounImageCubit, SetUserAccounImageState>(
      builder: (context, state) {
        if (state is SetUserAccounImageLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is SetUserAccounImageFail) {
          return Center(child: Text("Error Adding Image"));
        } else {
          return UserAccountImage(userImage: userImage);
        }
      },
    );
  }
}
