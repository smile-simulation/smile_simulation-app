import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:smile_simulation/features/home_feature/data/repos/posts_repo/posts_repo.dart';
import 'package:smile_simulation/features/home_feature/data/repos/posts_repo/posts_repo_implement.dart';

import '../../../data/models/post_model.dart';

part 'post_details_state.dart';

class PostDetailsCubit extends Cubit<PostDetailsState> {
  final PostModel post;
  final PostsRepoImplement postsRepo;
  PostDetailsCubit({required this.post, required this.postsRepo})
    : super(PostDetailsInitial());
}
