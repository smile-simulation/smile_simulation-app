import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import '../../../data/repos/set_user_account_image_repo/set_user_account_image_repo_impl.dart';

part 'set_user_accoun_image_state.dart';

class SetUserAccounImageCubit extends Cubit<SetUserAccounImageState> {
  SetUserAccounImageCubit(this.setUserAccountImageRepo)
      : super(SetUserAccounImageInitial());
  final SetUserAccountImageRepoImpl setUserAccountImageRepo;

  Future<void> setUserAccountImage() async {
    emit(SetUserAccounImageLoading());
    File? image = await pickImage();

    if (image != null) {
      var result = await setUserAccountImageRepo.setUserAccountImage(
        image: image,
      );
      result.fold(
        (fail) {
          emit(SetUserAccounImageFail(errorMsg: fail.errorMessage));
        },
        (imageLink) {
          emit(SetUserAccounImageSuccess(imageLink: imageLink));
        },
      );
    } else {
      emit(ImagePickedFailture());
    }
  }

  Future<File?> pickImage() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }
}