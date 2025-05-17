import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/helper_functions/format_date_time_ago.dart';
import 'package:smile_simulation/features/home_feature/presentation/cubits/comments_cubit/comments_cubit.dart';
import 'comment.dart';

class CommentsListView extends StatelessWidget {
  const CommentsListView({super.key});

  @override
  Widget build(BuildContext context) {
    CommentsCubit cubit = context.read<CommentsCubit>();
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        BlocConsumer<CommentsCubit, CommentsState>(
          listener: (BuildContext context, CommentsState state) {
            if (state is AddCommentSuccess) {
              cubit.getAllCommentsById();
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
                    child: Comment(
                      userName: comment.publisherName ?? "لا يوجد اسم معلق",
                      comment: comment.content ?? "لا يوجد محتوي",
                      date: formatDateTimeAgo(
                        rawDate: comment.createdAt.toString(),
                      ),
                    ),
                  );
                }),
              );
            } else if (state is GetAllCommentsByIdLoading ||
                state is AddCommentLoading ||
                state is AddCommentSuccess) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return const Center(child: Text("لم يتم تحميل التعليقات"));
            }
          },
        ),
      ],
    );
  }
}
