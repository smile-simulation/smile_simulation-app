import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:smile_simulation/features/home_feature/data/models/post_model.dart';

part 'comments_state.dart';

class CommentsCubit extends Cubit<CommentsState> {
  CommentsCubit(this.relatedPost) : super(CommentsInitial());
  TextEditingController commentController = TextEditingController();
  final FocusNode unitCodeCtrlFocusNode = FocusNode();
  PostModel relatedPost;
}
