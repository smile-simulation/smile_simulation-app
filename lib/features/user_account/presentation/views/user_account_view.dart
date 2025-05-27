import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/api/dio_consumer.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/features/home_feature/data/repos/posts_repo/posts_repo_implement.dart';

import '../../../home_feature/presentation/cubits/posts_cubit/posts_cubit.dart';
import 'widgets/user_account_view_body.dart';

class UserAccountView extends StatefulWidget {
  const UserAccountView({
    super.key,
    required this.currentUser,
    required this.userId,
    required this.userName,
    required this.userImage,
  });
  static const String routeName = 'user_account_view';
  final bool currentUser;

  final String userId;

  final String userName;
  final String? userImage;

  @override
  State<UserAccountView> createState() => _UserAccountViewState();
}

class _UserAccountViewState extends State<UserAccountView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => PostsCubit(
            PostsRepoImplement(dioConsumer: DioConsumer(dio: Dio())),
          ),
      child: Scaffold(
        appBar: customAppbar(
          title: "",
          isBack: true,
          context,
          goBack: () {
            setState(() {});
            Navigator.pop(context);
          },
        ),

        // AppBar(
        //   backgroundColor: AppColors.primaryColor,
        //   foregroundColor: AppColors.whiteColor,
        //   shadowColor: AppColors.transparent,
        //   elevation: 0,
        //   scrolledUnderElevation: 0,
        // ),
        extendBodyBehindAppBar: true,
        backgroundColor: AppColors.primaryColor,
        body: UserAccountViewBody(
          currentUser: widget.currentUser,
          userId: widget.userId,
          userName: widget.userName,
          userImage: widget.userImage,
          rebuild: () {
            setState(() {});
          },
        ),
      ),
    );
  }
}
