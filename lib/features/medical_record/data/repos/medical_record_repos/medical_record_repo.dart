
import '../../models/medical_record_models/medical_record_model.dart';

abstract class MedicalRecordRepository {
  Future<List<MedicalRecord>?> fetchMedicalRecords(String patientId);
}