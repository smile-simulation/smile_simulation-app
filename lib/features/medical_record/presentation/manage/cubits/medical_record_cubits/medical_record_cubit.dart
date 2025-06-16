import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/medical_record_models/medical_record_model.dart';
import '../../../../data/repos/medical_record_repos/medical_record_repo.dart';
import 'medical_record_state.dart';

class MedicalRecordCubit extends Cubit<MedicalRecordState> {
  final MedicalRecordRepository repository;

  MedicalRecordCubit(this.repository) : super(MedicalRecordInitial());

  void deleteMedicalRecord({
    required int historyId,
    required String username,
  }) async {
    emit(DeleteMedicalRecordLoading());
    try {
      final response = await repository.deleteMedicalRecord(
        historyId,
        username,
      );
      emit(DeleteMedicalRecordSuccess(response.message));
    } catch (e) {
      emit(DeleteMedicalRecordFailure(e.toString()));
    }
  }

  void addMedicalRecord({
    required String doctorId,
    required String username,
    required String prescription,
    required bool procedureSelectionsCleaning,
    required bool procedureSelectionsExtraction,
    required bool procedureSelectionsFilling,
    required bool procedureSelectionsInstallation,
    required bool procedureSelectionsNerveTreatment,
    required bool procedureSelectionsOther,
    required bool procedureSelectionsBridgeInstallation,
    required bool procedureSelectionsPhotos,
    String? procedureSelectionsOtherDescription,
    List<File>? files,
    required  String additionalNotes,
  }) async {
    emit(MedicalRecordLoading());
    try {
      final response = await repository.addMedicalRecord(
        doctorId,
        username,
        prescription,
        procedureSelectionsCleaning,
        procedureSelectionsExtraction,
        procedureSelectionsFilling,
        procedureSelectionsInstallation,
        procedureSelectionsNerveTreatment,
        procedureSelectionsOther,
        procedureSelectionsBridgeInstallation,
        procedureSelectionsPhotos,
        procedureSelectionsOtherDescription,
        files,
        additionalNotes,
      );
      emit(AddMedicalRecordSuccess(response));
    } catch (e) {
      emit(MedicalRecordFailure(e.toString()));
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
