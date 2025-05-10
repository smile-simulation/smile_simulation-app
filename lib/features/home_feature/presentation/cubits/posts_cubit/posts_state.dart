part of 'posts_cubit.dart';

sealed class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

final class PostsInitial extends PostsState {}

final class GetPostsSuccess extends PostsState {
  final List<PostModel> posts;

  GetPostsSuccess({required this.posts});
}

final class GetPostsLoading extends PostsState {}

final class GetPostsFailure extends PostsState {
  final String errorMsg;

  GetPostsFailure({required this.errorMsg});
}
