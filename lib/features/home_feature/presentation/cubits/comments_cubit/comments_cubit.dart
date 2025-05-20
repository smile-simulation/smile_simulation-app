import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../data/models/comment_model.dart';
import '../../../data/models/post_model.dart';
import '../../../data/repos/comments_repo/comments_repo_impl.dart';

part 'comments_state.dart';

class CommentsCubit extends Cubit<CommentsState> {
  final CommentsRepoImpl commentsRepo;
  CommentsCubit({required this.relatedPost, required this.commentsRepo})
    : super(CommentsInitial());
  TextEditingController commentController = TextEditingController();

  final FocusNode CommentTextFieldCtrlFocusNode = FocusNode();
  List<CommentModel> comments = [];
  bool commentAdded = false;

  PostModel relatedPost;

  Future<void> getAllCommentsById() async {
    emit(GetAllCommentsByIdLoading());
    var result = await commentsRepo.getAllCommentsByPostId(
      postId: relatedPost.id!,
    );
    result.fold(
      (fail) {
        emit(GetAllCommentsByIdFailture(errorMsg: fail.errorMessage));
      },
      (success) {
        comments = success;
        emit(GetAllCommentsByIdSuccess());
      },
    );
  }

  Future<void> addComment({required Function(String txt) onError}) async {
    emit(AddCommentLoading());

    if (commentController.text.trim().isNotEmpty) {
      var result = await commentsRepo.addPost(
        commentContent: commentController.text.trim(),
        postId: relatedPost.id!,
      );

      result.fold(
        (fail) {
          emit(AddCommentFailure());
          onError("لم يتم اضافة التعليق لإن ${fail}");
        },
        (success) {
          commentController.text = "";
          commentAdded = true;
          emit(AddCommentSuccess());
        },
      );
    } else {
      emit(GetAllCommentsByIdSuccess());
      onError("لم يتم اضافة التعليق لإنه لا يوجد محتوي");
    }
  }
}
