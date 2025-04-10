import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/features/home_feature/presentation/cubits/post_details_cubit/post_details_cubit.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/widgets/posts/add_comment_form_field.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/widgets/posts/comment_section_title.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/widgets/posts/comments_list_view_builder.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/widgets/posts/custom_post.dart';
import 'package:smile_simulation/generated/l10n.dart';

class PostViewBody extends StatelessWidget {
  const PostViewBody({super.key, required this.currentUser});
  final bool currentUser;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.whiteColor),
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
                        PostSectionsTitle(title: S.of(context).posts),
                        BlocBuilder<PostDetailsCubit, PostDetailsState>(
                          builder: (context, state) {
                            return CustomPost(
                              currentUser: currentUser,
                              isPostView: true,
                              post: context.read<PostDetailsCubit>().post,
                            );
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
