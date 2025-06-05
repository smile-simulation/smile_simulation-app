import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/constant.dart';
import 'package:smile_simulation/core/database/cache/cache_helper.dart';
import 'package:smile_simulation/core/widgets/custom_loading_shimmer.dart';
import '../../managers/set_user_account_image/set_user_accoun_image_cubit.dart';
import 'user_account_image.dart';

class UserAccountImageBuilder extends StatefulWidget {
  const UserAccountImageBuilder({
    super.key,
    required this.userImage,
    required this.rebuild,
    required this.currentUser,
  });
  final Function() rebuild;
  final String? userImage;
  final bool currentUser;

  @override
  State<UserAccountImageBuilder> createState() =>
      _UserAccountImageBuilderState();
}

class _UserAccountImageBuilderState extends State<UserAccountImageBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SetUserAccounImageCubit, SetUserAccounImageState>(
      listener: (context, state) {
        if (state is SetUserAccounImageFail) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMsg)));
        }
        if (state is SetUserAccounImageSuccess) {
          widget.rebuild();
        }
      },
      builder: (context, state) {
        String? currentImage;

        if (state is SetUserAccounImageSuccess) {
          currentImage = state.imageLink;
        } else {
          if (widget.currentUser) {
            currentImage =
                widget.userImage ??
                CacheHelper().getMap(key: userData)?["image"];
          } else {
            currentImage = widget.userImage;
          }
        }

        return state is SetUserAccounImageLoading
            ? CustomLoadingShimmer(
              SkeletonWidget: UserAccountImage(userImage: widget.userImage),
            )
            : UserAccountImage(userImage: currentImage);
      },
    );
  }
}
