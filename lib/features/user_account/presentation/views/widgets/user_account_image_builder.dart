import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/constant.dart';
import 'package:smile_simulation/core/database/cache/cache_helper.dart';
import 'package:smile_simulation/core/widgets/custom_loading_shimmer.dart';

import '../../managers/set_user_account_image/set_user_accoun_image_cubit.dart';
import 'user_account_image.dart';

class UserAccountImageBuilder extends StatefulWidget {
  const UserAccountImageBuilder({super.key, required this.userImage});

  final String? userImage;

  @override
  State<UserAccountImageBuilder> createState() =>
      _UserAccountImageBuilderState();
}

class _UserAccountImageBuilderState extends State<UserAccountImageBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SetUserAccounImageCubit, SetUserAccounImageState>(
      listener: (context, state) {
        if (state is SetUserAccounImageSuccess) {
          // setState(() {});
          
        }
      },
      builder: (context, state) {
        return BlocBuilder<SetUserAccounImageCubit, SetUserAccounImageState>(
          builder: (context, state) {
            if (state is SetUserAccounImageLoading) {
              return CustomLoadingShimmer(
                SkeletonWidget: UserAccountImage(userImage: widget.userImage),
              );
            } else if (state is SetUserAccounImageFail) {
              return Center(child: Text("Error Adding Image"));
            } else {
              return UserAccountImage(
                userImage: CacheHelper().getMap(key: userData)!["image"],
              );
            }
          },
        );
      },
    );
  }
}
