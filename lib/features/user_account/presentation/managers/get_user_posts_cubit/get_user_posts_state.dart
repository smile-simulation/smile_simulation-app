part of 'get_user_posts_cubit.dart';

sealed class GetUserPostsState extends Equatable {
  const GetUserPostsState();

  @override
  List<Object> get props => [];
}

final class GetUserPostsInitial extends GetUserPostsState {}

final class GetUserPostSuccess extends GetUserPostsState {
  final List<PostModel> posts;

  GetUserPostSuccess({required this.posts});
}

final class GetUserPostFailture extends GetUserPostsState {
  final String errorMsg;

  GetUserPostFailture({required this.errorMsg});
}

final class GetUserPostLoading extends GetUserPostsState {}

final class RemovePostSuccess extends GetUserPostsState {
  final String message;

  RemovePostSuccess({required this.message});
}

final class RemovePostFailture extends GetUserPostsState {
  final String errorMsg;

  RemovePostFailture({required this.errorMsg});
}

final class RemovePostLoading extends GetUserPostsState {}
