import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:smile_simulation/features/home_feature/data/repos/posts_repo/posts_repo_implement.dart';

import '../../../data/models/post_model.dart';

part 'post_details_state.dart';

class PostDetailsCubit extends Cubit<PostDetailsState> {
  PostModel post;
  final PostsRepoImplement postsRepo;
  bool? likedPost;
  bool likePostDone = false;
  PostDetailsCubit({required this.post, required this.postsRepo})
    : super(PostDetailsInitial());
  Future<void> makeLike({required int postId}) async {
    log("Make Like");
    var result = await postsRepo.makeLike(postId: post.id!);
    result.fold(
      (fail) {
        emit(MakeLikeFail(message: fail.errorMessage));
      },
      (success) {
        likedPost = (success == "تم اضافة الاعجاب للمنشور");
        likePostDone = !likePostDone;
        getPostById(postId: postId, makeLikeMessage: success);
      },
    );
  }

  Future<void> getPostById({
    required int postId,
    required String makeLikeMessage,
  }) async {
    log("this is the function with error${postId.toString()}");
    var result = await postsRepo.getPostById(postId: postId);
    result.fold((fail) {}, (success) {
      post = success;
      emit(MakeLikeSuccess(makeLikeResult: makeLikeMessage));
    });
  }
}
