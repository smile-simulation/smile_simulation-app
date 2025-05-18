import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/widgets/custom_button.dart';
import '../../../cubits/comments_cubit/comments_cubit.dart';
import 'comment.dart';
import 'widgets_skeletons/comment_skeleton/custom_comment_skeleton.dart';

class CommentsListView extends StatelessWidget {
  const CommentsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CommentsCubit, CommentsState>(
      listener: (BuildContext context, CommentsState state) {
        if (state is AddCommentSuccess) {
          context.read<CommentsCubit>().getAllCommentsById();
        }
      },
      builder: (context, state) {
        final cubit = context.read<CommentsCubit>();

        if (state is GetAllCommentsByIdSuccess) {
          if (cubit.comments.isEmpty) {
            return const Center(child: Text("لا يوجد تعليقات"));
          }
          return ListView.separated(
            itemCount: cubit.comments.length,
            itemBuilder: (context, index) {
              final comment = cubit.comments[index];
              return Comment(comment: comment);
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 16);
            },
          );
        } else if (state is GetAllCommentsByIdFailture) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("لم يتم تحميل التعليقات"),
                const SizedBox(height: 12),
                CustomButton(
                  onPressed: () => cubit.getAllCommentsById(),
                  title: "إعادة المحاولة",
                ),
              ],
            ),
          );
        } else {
          // Loading state
          return ListView.separated(
            itemCount: 8,
            itemBuilder:
                (context, index) => const Padding(
                  padding: EdgeInsets.only(bottom: 24),
                  child: CustomCommentSkeleton(),
                ),
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 16);
            },
          );
        }
      },
    );
  }
}
