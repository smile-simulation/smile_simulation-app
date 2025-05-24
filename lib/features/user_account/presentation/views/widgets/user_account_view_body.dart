import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/helper_functions/get_it.dart';
import 'package:smile_simulation/features/home_feature/data/repos/posts_repo/posts_repo_implement.dart';
import 'package:smile_simulation/features/home_feature/presentation/cubits/posts_cubit/posts_cubit.dart';
import 'package:smile_simulation/features/user_account/data/repos/user_details/user_details_repo_impl.dart';
import 'package:smile_simulation/features/user_account/presentation/managers/get_user_posts_cubit/get_user_posts_cubit.dart';

import 'user_account_header.dart';
import 'user_account_view_body_content.dart';

class UserAccountViewBody extends StatelessWidget {
  const UserAccountViewBody({
    super.key,
    required this.currentUser,
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.rebuild,
  });
  final bool currentUser;
  final String userId;
  final String userName;
  final String? userImage;
  final Function() rebuild;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserAccountHeader(
          currentUser: currentUser,
          userName: userName,
          userImage: userImage,
          rebuild: rebuild,
        ),
        MultiBlocProvider(
          providers: [
            BlocProvider(
              create:
                  (context) => GetUserPostsCubit(getIt<UserDetailsRepoImpl>()),
            ),
            BlocProvider(
              create: (context) => PostsCubit(getIt<PostsRepoImplement>()),
            ),
          ],
          child: UserAccountViewBodyContent(
            currentUser: currentUser,
            userId: userId,
            userName: userName,
            userImage: userImage,
          ),
        ),
      ],
    );
    // return NestedScrollView(
    //   headerSliverBuilder: (context, innerBoxIsScrolled) {
    //     return [
    //       SliverToBoxAdapter(
    //         child: UserAccountHeader(currentUser: currentUser),
    //       ),
    //     ];
    //   },
    //   body: UserAccountViewBodyContent(currentUser: currentUser),
    // );
  }
}
