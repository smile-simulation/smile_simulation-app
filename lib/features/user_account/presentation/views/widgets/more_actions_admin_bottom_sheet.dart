import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/widgets/bottom_navigation_bar/bottom_nvaigation_view.dart';
import 'package:smile_simulation/core/widgets/user_details_list_tile.dart';
import 'package:smile_simulation/features/home_feature/data/models/post_model.dart';
import 'package:smile_simulation/features/home_feature/presentation/cubits/posts_cubit/posts_cubit.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/edit_post_view.dart';
import 'package:smile_simulation/generated/l10n.dart';



class MoreActionsAdminBottomShet extends StatelessWidget {
  const MoreActionsAdminBottomShet({
    super.key,
    required this.height,
    required this.update,
    required this.post,
  });
  final bool update;
  final double height;
  final PostModel post;

  @override
  Widget build(BuildContext context) {
    PostsCubit postsCubit = context.read<PostsCubit>();

    return BlocProvider.value(
      value: postsCubit,
      child: BlocConsumer<PostsCubit, PostsState>(
        listener: (context, state) async {
          if (state is RemovePostSuccess) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => BottomNavigationView()),
              (route) => false, // امسح كل اللي قبل
            );
          }
        },
        builder: (context, state) {
          if (state is RemovePostLoading) {
            return Container(
              width: double.infinity,
              height: height,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
              ),
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            );
          }
          return Container(
            width: double.infinity,
            height: height,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: 6,
                  decoration: BoxDecoration(
                    color: AppColors.greyLightColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                const SizedBox(height: 40),
                CustomListTile(
                  title: S.of(context).deletePost,
                  icon: Icons.delete,
                  iconColor: AppColors.redColor,
                  onTap: () {
                    postsCubit.removePostById(postId: post.id!);
                  },
                ),
                const SizedBox(height: 16),
                Visibility(
                  visible: update,
                  child: CustomListTile(
                    title: S.of(context).editPost,
                    icon: Icons.edit,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return EditPostView(post: post);
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
