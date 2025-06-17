import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smile_simulation/core/widgets/custom_loading_shimmer.dart';
import 'package:smile_simulation/generated/assets.dart';

import '../../../../home_feature/presentation/views/widgets/posts/widgets_skeletons/user_image_skeleton.dart';

class UserAccountImage extends StatelessWidget {
  const UserAccountImage({
    super.key,
    required this.userImage,
  });

  final String? userImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 120,
      child:
          userImage == null
              ? CircleAvatar(
                backgroundImage: AssetImage(Assets.imagesUser),
                radius: 20,
              )
              : CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey[200], // Or any neutral background
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: userImage!,
                    fit: BoxFit.cover,
                    width: 120,
                    height: 120,
                    placeholder:
                        (context, url) => CustomLoadingShimmer(
                          SkeletonWidget: UserImageSkeleton(),
                        ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
    );
  }
}
