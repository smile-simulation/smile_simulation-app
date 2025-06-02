import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/database/cache/cache_helper.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/widgets/user_details_list_tile.dart';
import 'package:smile_simulation/features/user_account/presentation/managers/get_user_posts_cubit/get_user_posts_cubit.dart';
import 'package:smile_simulation/generated/l10n.dart';

class moreActionsPostsBottomSheet extends StatelessWidget {
  const moreActionsPostsBottomSheet({
    super.key,
    required this.height,
    required this.PostId,
    this.getUserPostsCubit,
  });

  final double height;
  final int PostId;

  final GetUserPostsCubit? getUserPostsCubit;
  @override
  Widget build(BuildContext context) {
    if (getUserPostsCubit == null) {
      return const Center(child: Text("Cubit is missing"));
    }

    return BlocProvider.value(
      value: getUserPostsCubit!,
      child: BlocConsumer<GetUserPostsCubit, GetUserPostsState>(
        listener: (context, state) async {
          if (state is RemovePostSuccess) {
            await getUserPostsCubit!.getUserPostsByUserId(
              userId: CacheHelper().getMap(key: 'userData')!['userId'],
            );
            // await context.read<PostsCubit>().refreshPosts();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
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
                    getUserPostsCubit!.removePostById(postId: PostId);
                  },
                ),
                const SizedBox(height: 16),
                CustomListTile(title: S.of(context).editPost, icon: Icons.edit),
              ],
            ),
          );
        },
      ),
    );
  }
}
