import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/repos/personal_data_repos/personal_data_repo.dart';
import 'get_personal_data_state.dart';

class GetPersonalDataCubit extends Cubit<GetPersonalDataState> {
  GetPersonalDataCubit({required this.personalDataRepo})
    : super(GetPersonalDataInitial());

  final PersonalDataRepo personalDataRepo;

  Future<void> getPersonalData({required String userName}) async {
    emit(GetPersonalDataLoading());
    final result = await personalDataRepo.getPersonalData(userName: userName);

    result.fold(
      (l) => emit(GetPersonalDataFailure(l.errorMessage)),
      (r) => emit(GetPersonalDataSuccess( r  )),
    );
  }
}
