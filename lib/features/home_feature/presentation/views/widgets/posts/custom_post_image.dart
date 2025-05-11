import 'package:flutter/material.dart';
import 'package:smile_simulation/core/widgets/custom_cached_network_image.dart';

class CustomPostImage extends StatelessWidget {
  const CustomPostImage({super.key, required this.image});
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.antiAlias, // Smoother clipping

      child: CustomCachedNetworkImage(fit: BoxFit.contain, image: image),
    );
  }
}
