import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/repos/posts_repo/posts_repo_implement.dart';

part 'add_post_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  final PostsRepoImplement postsRepo;
  File? imageFile;
  Uint8List? imageBytes;
  TextEditingController contentController = TextEditingController();

  AddPostCubit(this.postsRepo) : super(AddPostInitial());

  Future<void> pickImage() async {
    emit(ImagePickedLoading());
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      imageBytes = await imageFile!.readAsBytes();
      emit(ImagePickedSuccess());
    } else {
      emit(ImagePickedFailture());
    }
  }

  Future<void> clearImage() async {
    imageFile = null;
    imageBytes = null;
    emit(ImagePickedSuccess());
  }

  Future<void> addPost({required Function(String txt) onError}) async {
    emit(AddPostLoading());
    if (contentController.text != '' && contentController.text.isNotEmpty) {
      var result = await postsRepo.addPost(
        content: contentController.text,
        image: imageFile,
      );
      result.fold(
        (fail) {
          emit(AddPostFailture(fail: fail.errorMessage));
          onError("لم يتم اضافة المنشور لإن ${fail}");
        },
        (success) {
          emit(AddPostSuccess());
        },
      );
    } else {
      emit(AddPostFailture(fail: "لم يتم اضافة المنشور لإنه لا يوجد محتوي"));
      onError("لم يتم اضافة المنشور لإنه لا يوجد محتوي");
    }
  }
}
