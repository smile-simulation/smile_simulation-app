import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/features/medical_record/presentation/manage/cubits/update_health_status_cubit/update_health_status_state.dart';

import '../../../data/repos/edit_profile_repos/edit_profile_repo.dart';
import 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit({required this.editProfileRepo})
    : super(EditProfileInitial());

  final EditProfileRepo editProfileRepo;

  Future<void> editProfile({
    required String fullName,
    required String age,
    required String gender,
    required String experience,
    required String qualification,

    required String specialization,
    required String address,
    required DateTime birthDay,
  }) async {
    emit(EditProfileLoading());
    final result = await editProfileRepo.updateProfile(
      fullName: fullName,
      age: age,
      gender: gender,
      experience: experience,
      qualification: qualification,

      specialization: specialization,
      address: address,
      birthDay: birthDay,
    );

    result.fold(
      (l) => emit(EditProfileFailure(l.errorMessage)),
      (r) => emit(EditProfileSuccess(r)),
    );
  }
}
