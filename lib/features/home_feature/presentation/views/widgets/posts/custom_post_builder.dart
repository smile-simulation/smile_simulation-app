import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/helper_functions/format_date_time_ago.dart';
import 'package:smile_simulation/core/helper_functions/show_custom_snack_bar.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

import '../../../../data/models/post_model.dart';
import '../../../cubits/post_details_cubit/post_details_cubit.dart';
import '../../post_view.dart';
import 'post_footer.dart';
import 'post_header.dart';
import 'post_horizontal_layout.dart';

class CustomPostBuilder extends StatelessWidget {
  const CustomPostBuilder({
    super.key,
    required this.currentUser,
    required this.clickablePostImage,
  });

  final bool currentUser;
  final bool clickablePostImage;
  @override
  Widget build(BuildContext context) {
    PostDetailsCubit cubit = context.read<PostDetailsCubit>();
    return BlocConsumer<PostDetailsCubit, PostDetailsState>(
      listener: (BuildContext context, PostDetailsState state) {
        if (state is MakeLikeSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.makeLikeResult),
              backgroundColor: AppColors.primaryColor,
            ),
          );
        } else if (state is MakeLikeFail) {
          customShowSnackBar(context, state.message);
        }
      },

      builder: (context, state) {
        PostModel post = cubit.post;
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, PostView.routeName, arguments: post);
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PostHeader(
                  userName: post.publisherName ?? "No Publisher Name",
                  postDate: formatDateTimeAgo(
                    rawDate: post.createdAt.toString(),
                  ),
                  currentUser: currentUser,
                  clickablePostImage: clickablePostImage,
                ),
                const SizedBox(height: 4),
                PostHorizontalLayout(post: post),
                const SizedBox(height: 12),
                PostFooter(post: post),
              ],
            ),
          ),
        );
      },
    );
  }
}
