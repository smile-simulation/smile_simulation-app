import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smile_simulation/core/services/pick_image_surevice.dart';

import '../../../data/repos/posts_repo/posts_repo_implement.dart';

part 'add_post_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  final PostsRepoImplement postsRepo;
  File? image;
  TextEditingController contentController = TextEditingController();
  AddPostCubit(this.postsRepo) : super(AddPostInitial());
  Future<void> pickImage() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      image = File(pickedFile.path);
      emit(ImagePickedSuccess());
    } else {
      emit(ImagePickedFailture());
    }
  }

  Future<void> addPost() async {
    emit(AddPostLoading());
    if (contentController.text != '' && contentController.text.isNotEmpty) {
      var result = await postsRepo.addPost(
        content: contentController.text,
        image: image,
      );
      result.fold(
        (fail) {
          emit(AddPostFailture(fail: fail.errorMessage));
        },
        (success) {
          emit(AddPostSuccess());
        },
      );
    } else {
      log("No Content");
    }
  }
}
