import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/repos/personal_data_repos/personal_data_repo.dart';
import 'update_personal_data_state.dart';

class UpdatePersonalDataCubit extends Cubit<UpdatePersonalDataState> {
  UpdatePersonalDataCubit({required this.personalDataRepo})
    : super(UpdatePersonalDataInitial());

  final PersonalDataRepo personalDataRepo;

  Future<void> updatePersonalData({
    required String userName,
    required String fullName,
    required String email,
    required int age,
    required String phoneNumber,
    required String gender,
    required String job,
    required String maritalStatus,
  }) async {
    emit(UpdatePersonalDataLoading());
    final result = await personalDataRepo.updatePersonalData(
      userName: userName,
      fullName: fullName,
      email: email,
      age: age,
      phoneNumber: phoneNumber,
      gender: gender,
      job: job,
      maritalStatus: maritalStatus,
    );

    result.fold(
      (l) => emit(UpdatePersonalDataFailure(l.errorMessage)),
      (r) => emit(UpdatePersonalDataSuccess(r)),
    );
  }
}
