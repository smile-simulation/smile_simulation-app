import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/widgets/custom_sliver_sized_box.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/widgets/posts/comment_section_title.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/widgets/posts_list_view_builder.dart';
import 'package:smile_simulation/features/user_account/presentation/views/widgets/add_post.dart';
import 'package:smile_simulation/generated/l10n.dart';

import 'edit_data_button.dart';
import 'user_account_title.dart';
import 'user_details_section.dart';

class UserAccountViewBodyContent extends StatelessWidget {
  final bool currentUser;
  const UserAccountViewBodyContent({super.key, required this.currentUser});
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
                visible: currentUser,
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
            PostsListViewBuilder(
              isSliver: true,
              clickablePostImage: false,
              currentUser: true,
            ),
          ],
        ),
      ),
    );
  }
}
