import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/generated/l10n.dart';

import '../../../cubits/post_details_cubit/post_details_cubit.dart';
import 'add_comment_form_field.dart';
import 'comment_section_title.dart';
import 'comments_list_view_builder.dart';
import 'custom_post_view_post.dart';

class PostViewBody extends StatelessWidget {
  const PostViewBody({super.key, required this.currentUser});
  final bool currentUser;
  @override
  Widget build(BuildContext context) {
    return CustomBodyScreen(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16),
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),

                        BlocBuilder<PostDetailsCubit, PostDetailsState>(
                          builder: (context, state) {
                            return PostViewPost(currentUser: currentUser);
                          },
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        SizedBox(height: 24),
                        Divider(),
                        SizedBox(height: 24),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: PostSectionsTitle(title: S.of(context).comments),
                  ),
                  CommentsListViewBuilder(isSliver: true),
                ],
              ),
            ),

            AddCommentFormField(),
          ],
        ),
      ),
    );
  }
}
