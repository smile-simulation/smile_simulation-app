import 'dart:io';

import '../../models/medical_record_models/delete_medical_record_model.dart';
import '../../models/medical_record_models/medical_record_model.dart';

abstract class MedicalRecordRepository {
  Future<List<MedicalRecord>?> fetchMedicalRecords(String patientId);

  Future<DeleteMedicalRecordResponse> deleteMedicalRecord(int historyId
      , String username);

  Future<AddMedicalRecordResponse> addMedicalRecord(
      String doctorId,
      String username,
      String prescription,
      bool procedureSelectionsCleaning,
      bool procedureSelectionsExtraction,
      bool procedureSelectionsFilling,
      bool procedureSelectionsInstallation,
      bool procedureSelectionsNerveTreatment,
      bool procedureSelectionsOther,
      bool procedureSelectionsBridgeInstallation,
      bool procedureSelectionsPhotos,
      String? procedureSelectionsOtherDescription,
      List<File>? files,
      String additionalNotes,
      );
}