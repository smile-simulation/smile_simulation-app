import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/repos/medical_record_repos/medical_record_repo.dart';
import 'medical_record_state.dart';

class MedicalRecordCubit extends Cubit<MedicalRecordState> {
  final MedicalRecordRepository repository;

  MedicalRecordCubit(this.repository) : super(MedicalRecordInitial());

  void deleteMedicalRecord({ required int historyId,
    required String username}
      ) async {
    emit(DeleteMedicalRecordLoading());
    try {
      final response = await repository.deleteMedicalRecord(
        historyId,
        username
      );
      emit( DeleteMedicalRecordSuccess(

         response.message

      ));
    } catch (e) {
      emit(DeleteMedicalRecordFailure(e.toString()));
    }
  }

  void fetchMedicalRecords(String patientId) async {
    emit(MedicalRecordLoading());
    final records = await repository.fetchMedicalRecords(patientId);
    if (records != null && records.isNotEmpty) {
      emit(MedicalRecordSuccess(records));
    } else {
      emit(MedicalRecordFailure('لا يوجد سجلات طبية لهذا المريض'));
    }
  }
}