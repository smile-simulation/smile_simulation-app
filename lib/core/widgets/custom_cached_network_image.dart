import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smile_simulation/core/widgets/custom_loading_shimmer.dart';

import '../../features/advices/presentation/views/widgets/in_valid_category_image.dart';
import '../../features/advices/presentation/views/widgets/widgets_skeletons/category_image_skeleton.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.image,
    required this.height,
    required this.width,
  });

  final String? image;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child:
          image == null
              ? InValidCategoryImage()
              : CachedNetworkImage(
                imageUrl: image!,
                width: width,
                height: height,
                fit: BoxFit.cover,
                placeholder:
                    (context, url) => CustomLoadingShimmer(
                      SkeletonWidget: CategoryImageSkeleton(),
                    ),
                errorWidget: (context, url, error) => InValidCategoryImage(),
              ),
    );
  }
}
