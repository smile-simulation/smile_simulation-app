part of 'post_details_cubit.dart';

@immutable
sealed class PostDetailsState {}

final class PostDetailsInitial extends PostDetailsState {}


final class GetCommentsSuccess extends PostDetailsState {}

final class GetCommentsFailture extends PostDetailsState {}

final class GetCommentsLoading extends PostDetailsState {}

final class AddCommentSuccess extends PostDetailsState {}

final class AddCommentFailture extends PostDetailsState {}

final class AddCommentLoading extends PostDetailsState {}

final class DeleteCommentSuccess extends PostDetailsState {}

final class DeleteCommentFailture extends PostDetailsState {}

final class DeleteCommentLoading extends PostDetailsState {}
