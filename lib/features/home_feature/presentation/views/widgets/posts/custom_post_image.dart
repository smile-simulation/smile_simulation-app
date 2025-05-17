import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/widgets/custom_cached_network_image.dart';
import 'package:smile_simulation/features/home_feature/presentation/cubits/post_details_cubit/post_details_cubit.dart';

class CustomPostImage extends StatelessWidget {
  const CustomPostImage({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.antiAlias, // Smoother clipping

      child: CustomCachedNetworkImage(
        fit: BoxFit.contain,
        image: context.read<PostDetailsCubit>().post.postImage,
      ),
    );
  }
}
