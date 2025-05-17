part of 'comments_cubit.dart';

sealed class CommentsState extends Equatable {
  const CommentsState();

  @override
  List<Object> get props => [];
}

final class CommentsInitial extends CommentsState {}

final class GetAllCommentsByIdSuccess extends CommentsState {
  final List<CommentModel> comments;

  GetAllCommentsByIdSuccess({required this.comments});
}

final class GetAllCommentsByIdFailture extends CommentsState {
  final String errorMsg;

  GetAllCommentsByIdFailture({required this.errorMsg});
}

final class GetAllCommentsByIdLoading extends CommentsState {}
