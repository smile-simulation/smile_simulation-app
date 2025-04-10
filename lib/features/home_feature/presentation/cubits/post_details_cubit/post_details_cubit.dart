import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:smile_simulation/features/home_feature/data/models/post_model.dart';

part 'post_details_state.dart';

class PostDetailsCubit extends Cubit<PostDetailsState> {
  final PostModel post;
  PostDetailsCubit(this.post) : super(PostDetailsInitial());
}
