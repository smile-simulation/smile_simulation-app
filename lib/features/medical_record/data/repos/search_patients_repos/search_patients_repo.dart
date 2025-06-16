import '../../models/search_patients_model/search_patients_model.dart';

abstract class PatientRepository {
  Future<Patient?> checkPatient(String userId);
}