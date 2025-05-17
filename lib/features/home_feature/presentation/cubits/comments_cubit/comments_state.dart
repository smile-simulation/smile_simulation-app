part of 'comments_cubit.dart';

sealed class CommentsState extends Equatable {
  const CommentsState();

  @override
  List<Object> get props => [];
}

final class CommentsInitial extends CommentsState {}

final class GetAllCommentsByIdSuccess extends CommentsState {}

final class GetAllCommentsByIdFailture extends CommentsState {
  final String errorMsg;

  GetAllCommentsByIdFailture({required this.errorMsg});
}

final class GetAllCommentsByIdLoading extends CommentsState {}

final class AddCommentLoading extends CommentsState {}

final class AddCommentSuccess extends CommentsState {}

final class AddCommentFailure extends CommentsState {}
