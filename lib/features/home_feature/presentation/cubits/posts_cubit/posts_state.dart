part of 'posts_cubit.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

class PostsInitial extends PostsState {}

class PostsLoading extends PostsState {}

class PostsSuccess extends PostsState {
  final List<PostModel> posts;
  final bool hasMore;

  const PostsSuccess({required this.posts, required this.hasMore});

  @override
  List<Object> get props => [posts, hasMore];
}

class PostsError extends PostsState {
  final String errorMsg;

  const PostsError({required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}
