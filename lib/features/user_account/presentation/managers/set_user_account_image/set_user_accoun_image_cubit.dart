import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/repos/set_user_account_image_repo/set_user_account_image_repo_impl.dart';

part 'set_user_accoun_image_state.dart';

class SetUserAccounImageCubit extends Cubit<SetUserAccounImageState> {
  SetUserAccounImageCubit(this.setUserAccountImageRepo)
    : super(SetUserAccounImageInitial());
  final SetUserAccountImageRepoImpl setUserAccountImageRepo;
  Uint8List? bytesImage;
  Future<void> setUserAccountImage() async {
    File? image = await pickImage();

    if (image != null) {
      var result = await setUserAccountImageRepo.setUserAccountImage(
        image: image,
      );
      result.fold(
        (fail) {
          emit(SetUserAccounImageFail(errorMsg: fail.errorMessage));
        },
        (success) {
          bytesImage = success;
          emit(SetUserAccounImageSuccess());
        },
      );
    }
  }

  Future<File?> pickImage() async {
    emit(ImagePickedLoading());
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      return imageFile;
    } else {
      emit(ImagePickedFailture());
      return null;
    }
  }
}
