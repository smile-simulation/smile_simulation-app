import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smile_simulation/features/home_feature/data/models/post_model.dart';

import '../../../data/repos/edit_post_repo/edit_post_repo.dart';

part 'edit_post_state.dart';

class EditPostCubit extends Cubit<EditPostState> {
  EditPostCubit({required this.editPostRepo, required this.post})
    : super(EditPostInitial());
  final PostModel post;
  final EditPostRepo editPostRepo;
  final TextEditingController contentController = TextEditingController();
  File? imageFile;
  Uint8List? imageBytes;

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

  Future<void> EditPost({required Function(String txt) onError}) async {
    emit(EditPostLoading());
    if ((contentController.text != '' && contentController.text.isNotEmpty) ||
        imageFile != null) {
      var result = await editPostRepo.editPost(
        postContent: contentController.text,
        postImage: imageFile,
        postId: post.id!,
      );
      result.fold(
        (fail) {
          emit(EditPostFailture(message: fail.errorMessage));
          onError("لم يتم اضافة المنشور لإن ${fail}");
        },
        (success) {
          emit(EditPostSuccess(message: success));
        },
      );
    } else {
      emit(
        EditPostFailture(message: "لم يتم اضافة المنشور لإنه لا يوجد محتوي"),
      );
      onError("لم يتم اضافة المنشور لإنه لا يوجد محتوي");
    }
  }
}
