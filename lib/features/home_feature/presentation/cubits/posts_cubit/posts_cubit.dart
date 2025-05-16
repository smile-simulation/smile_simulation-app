import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/post_model.dart';
import '../../../data/repos/posts_repo/posts_repo_implement.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit(this.postsRepo) : super(PostsInitial());

  final PostsRepoImplement postsRepo;

   List<PostModel> posts = [];
  int _currentPage = 1;
  final int _pageSize = 10;
  bool _isLoading = false;
  bool _hasReachedEnd = false;
  bool newLikeStatus = false;
  bool get hasReachedEnd => _hasReachedEnd;

  Future<void> fetchPosts({bool isInitialLoad = false}) async {
    if (_isLoading || _hasReachedEnd) return;

    _isLoading = true;

    if (isInitialLoad) {
      _currentPage = 1;
      _hasReachedEnd = false;
      posts.clear();
    }

    final result = await postsRepo.getPosts(
      pageNumber: _currentPage,
      pageSize: _pageSize,
    );

    result.fold((failure) => emit(PostsError(errorMsg: failure.errorMessage)), (
      newPosts,
    ) {
      if (newPosts.length < _pageSize) {
        _hasReachedEnd = true;
      }

      posts.addAll(newPosts);
      _currentPage++;

      emit(PostsSuccess(posts: posts, hasMore: !_hasReachedEnd));
    });

    _isLoading = false;
  }
}
