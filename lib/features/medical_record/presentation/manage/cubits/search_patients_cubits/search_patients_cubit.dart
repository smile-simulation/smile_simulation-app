import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/features/medical_record/presentation/manage/cubits/search_patients_cubits/search_patients_state.dart';

import '../../../../data/repos/search_patients_repos/search_patients_repo.dart';

class PatientCubit extends Cubit<PatientState> {
  final PatientRepository repository;

  PatientCubit(this.repository) : super(PatientInitial());

  void checkPatient(String userId) async {
    emit(PatientLoading());
    final patient = await repository.checkPatient(userId);
    if (patient != null) {
      emit(PatientSuccess(patient));
    } else {
      emit(PatientFailure('المريض غير موجود'));
    }
  }
}