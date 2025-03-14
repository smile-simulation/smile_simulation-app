import 'package:flutter/material.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/widgets/posts/comment_section_title.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/widgets/posts/comments_list_view_builder.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/widgets/posts/custom_post.dart';
import 'package:smile_simulation/generated/l10n.dart';

class PostViewBody extends StatelessWidget {
  const PostViewBody({super.key, required this.currentUser});
  final bool currentUser;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                PostSectionsTitle(title: S.of(context).posts),
                CustomPost(currentUser: currentUser),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [SizedBox(height: 24), Divider(), SizedBox(height: 24)],
            ),
          ),
          SliverToBoxAdapter(
            child: PostSectionsTitle(title: S.of(context).comments),
          ),
          CommentsListViewBuilder(isSliver: true),
        ],
      ),
    );
  }
}
