import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits/comments_cubit/comments_cubit.dart';
import '../../../cubits/post_details_cubit/post_details_cubit.dart';
import 'comment.dart';
import 'widgets_skeletons/comment_skeleton/custom_comment_skeleton.dart';

class CommentsSliverListView extends StatelessWidget {
  const CommentsSliverListView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CommentsCubit>();

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: BlocConsumer<CommentsCubit, CommentsState>(
          listener: (BuildContext context, CommentsState state) {
            if (state is AddCommentSuccess) {
              cubit.getAllCommentsById();

              context.read<PostDetailsCubit>().getPostById(
                postId: cubit.relatedPost.id!,
                makeLikeMessage: "تم اضافة تعليق بنجاح",
              );
            }
          },

          builder: (context, state) {
            if (state is GetAllCommentsByIdSuccess) {
              if (cubit.comments.isEmpty) {
                return const Center(child: Text("لا يوجد تعليقات"));
              }

              return Column(
                children: List.generate(cubit.comments.length, (index) {
                  final comment = cubit.comments[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Comment(comment: comment),
                  );
                }),
              );
            } else if (state is GetAllCommentsByIdFailture) {
              return const Center(child: Text("لم يتم تحميل التعليقات"));
            } else {
              // Loading skeletons
              return Column(
                children: List.generate(8, (_) {
                  return const Padding(
                    padding: EdgeInsets.only(bottom: 24),
                    child: CustomCommentSkeleton(),
                  );
                }),
              );
            }
          },
        ),
      ),
    );
  }
}
