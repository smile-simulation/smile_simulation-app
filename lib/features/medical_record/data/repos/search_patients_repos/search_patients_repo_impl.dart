import 'package:dio/dio.dart';
import 'package:smile_simulation/features/medical_record/data/repos/search_patients_repos/search_patients_repo.dart';
import '../../models/search_patients_model/search_patients_model.dart';

class PatientRepositoryImpl implements PatientRepository {
  final Dio dio = Dio();
  static const String baseUrl = 'http://smilesimulation.runasp.net/api/User';

  @override
  Future<Patient?> checkPatient(String userId) async {
    try {
      final response = await dio.get('$baseUrl/CheckPatientAsync/$userId');
      if (response.statusCode == 200) {
        final data = response.data;

          return Patient.fromJson(data);

      }
      return null;
    } catch (e) {
      return null;
    }
  }
}