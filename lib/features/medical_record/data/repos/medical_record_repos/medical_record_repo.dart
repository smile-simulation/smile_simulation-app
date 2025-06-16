
import '../../models/medical_record_models/delete_medical_record_model.dart';
import '../../models/medical_record_models/medical_record_model.dart';

abstract class MedicalRecordRepository {
  Future<List<MedicalRecord>?> fetchMedicalRecords(String patientId);
  Future<DeleteMedicalRecordResponse> deleteMedicalRecord(int historyId
      , String username

      );
}