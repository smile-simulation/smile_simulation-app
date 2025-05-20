import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/database/cache/cache_helper.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/widgets/custom_sliver_sized_box.dart';
import 'package:smile_simulation/features/user_account/presentation/managers/get_user_posts_cubit/get_user_posts_cubit.dart';
import 'package:smile_simulation/features/user_account/presentation/views/widgets/add_post.dart';
import 'package:smile_simulation/generated/l10n.dart';

import '../../../../home_feature/presentation/views/widgets/posts/comment_section_title.dart';
import 'edit_data_button.dart';
import 'posts_sliver_list_view.dart';
import 'user_account_title.dart';
import 'user_details_section.dart';

class UserAccountViewBodyContent extends StatefulWidget {
  final bool currentUser;
  const UserAccountViewBodyContent({
    super.key,
    required this.currentUser,
    required this.userId,
    required this.userName,
    required this.userImage,
  });
  final String? userId;

  final String userName;
  final String? userImage;
  @override
  State<UserAccountViewBodyContent> createState() =>
      _UserAccountViewBodyContentState();
}

class _UserAccountViewBodyContentState
    extends State<UserAccountViewBodyContent> {
  @override
  void initState() {
    log("The USER ID: ${widget.userId}");
    context.read<GetUserPostsCubit>().getUserPostsByUserId(
      userId: widget.userId ?? CacheHelper().getMap(key: 'userData')!['userId'],
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(45),
            topRight: Radius.circular(45),
          ),
        ),
        child: CustomScrollView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          slivers: [
            SliverToBoxAdapter(child: UserAccountTitle()),
            CustomSliverSizedBox(height: 16),
            SliverToBoxAdapter(child: UserDetailsSection()),
            CustomSliverSizedBox(height: 16),
            SliverToBoxAdapter(
              child: Visibility(
                visible: widget.currentUser,
                child: Column(
                  children: [EditDataButton(), SizedBox(height: 16), AddPost()],
                ),
              ),
            ),
            CustomSliverSizedBox(height: 16),
            SliverToBoxAdapter(
              child: PostSectionsTitle(title: S.of(context).posts),
            ),
            CustomSliverSizedBox(height: 16),
            PostsSliverListView(),
          ],
        ),
      ),
    );
  }
}
