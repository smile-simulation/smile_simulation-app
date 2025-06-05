import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smile_simulation/features/home_feature/data/models/post_model.dart';

import '../../../data/repos/user_details/user_details_repo_impl.dart';

part 'get_user_posts_state.dart';

class GetUserPostsCubit extends Cubit<GetUserPostsState> {
  GetUserPostsCubit(this.userDetailsRepo) : super(GetUserPostsInitial());
  final UserDetailsRepoImpl userDetailsRepo;
  Future<void> getUserPostsByUserId({required String userId}) async {
    emit(GetUserPostLoading());
    var result = await userDetailsRepo.getPosts(userId: userId);
    result.fold(
      (fail) {
        emit(GetUserPostFailture(errorMsg: fail.errorMessage));
      },
      (success) {
        emit(GetUserPostSuccess(posts: success));
      },
    );
  }

  Future<void> removePostById({required int postId}) async {
    emit(RemovePostLoading());
    var result = await userDetailsRepo.removePost(postId: postId);
    result.fold(
      (fail) {
        emit(RemovePostFailture(errorMsg: fail.errorMessage));
      },
      (success) {
        emit(RemovePostSuccess(message: success));
      },
    );
  }
}
