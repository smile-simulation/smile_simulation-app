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




  bool get hasReachedEnd => _hasReachedEnd;

  Future<void> fetchPosts({bool isInitialLoad = false}) async {
    if (_isLoading || _hasReachedEnd) return;

    _isLoading = true;

    if (isInitialLoad) {
      emit(PostsLoading());
      _currentPage = 1;
      _hasReachedEnd = false;
      posts.clear();
    }

    try {
      final result = await postsRepo.getPosts(
        pageNumber: _currentPage,
        pageSize: _pageSize,
      );

      result.fold(
            (failure) {
          emit(PostsError(errorMsg: failure.errorMessage));
        },
            (newPosts) {
          if (newPosts.length < _pageSize) {
            _hasReachedEnd = true;
          }

          posts.addAll(newPosts);
          _currentPage++;

          emit(PostsSuccess(posts: List.from(posts), hasMore: !_hasReachedEnd));
        },
      );
    } finally {
      _isLoading = false;
    }
  }
  Future<void> fetchNewPosts() async {
    final result = await postsRepo.getPosts(
      pageNumber: 1,
      pageSize: _pageSize,
    );

    result.fold(
          (failure) => emit(PostsError(errorMsg: failure.errorMessage)),
          (newPosts) {
        // لو في بوستات جديدة
        if (newPosts.isNotEmpty && newPosts.first.id != posts.first.id) {
          posts.insertAll(0, newPosts.where((post) =>
          !posts.any((existing) => existing.id == post.id)));
          emit(PostsSuccess(posts: posts, hasMore: !_hasReachedEnd));
        }
      },
    );
  }


  /// 🔄 إعادة تحميل المنشورات (مثلاً عند السحب للتحديث)
  Future<void> refreshPosts() async {
    _currentPage = 1;
    _hasReachedEnd = false;
    posts.clear();
    emit(PostsLoading());
    await fetchPosts(isInitialLoad: true);
  }
}
