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
  final FocusNode unitCodeCtrlFocusNode = FocusNode();
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
        emit(GetAllCommentsByIdSuccess(comments: success));
      },
    );
  }
}
