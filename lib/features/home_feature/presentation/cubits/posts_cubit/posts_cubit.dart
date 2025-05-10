
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/post_model.dart';
import '../../../data/repos/posts_repo/posts_repo_implement.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit(this.postsRepo) : super(PostsInitial());
  final PostsRepoImplement postsRepo;
  List<PostModel>? posts;

  Future<void> getPosts() async {
    var done = await postsRepo.getPostsRepo();
    done.fold(
      (fail) {
        emit(GetPostsFailure(errorMsg: fail.errorMessage));
      },
      (success) {
        posts = success;
        emit(GetPostsSuccess(posts: success));
      },
    );
  }
}
