part of 'post_details_cubit.dart';

@immutable
sealed class PostDetailsState {}

final class PostDetailsInitial extends PostDetailsState {}

final class MakeLikeSuccess extends PostDetailsState {
  final String makeLikeResult;

  MakeLikeSuccess({required this.makeLikeResult});
}

final class MakeLikeFail extends PostDetailsState {
  final String message;

  MakeLikeFail({required this.message});
}

final class MakeLikeLoading extends PostDetailsState {}

final class DeleteCommentSuccess extends PostDetailsState {}

final class DeleteCommentFailture extends PostDetailsState {}

final class DeleteCommentLoading extends PostDetailsState {}
