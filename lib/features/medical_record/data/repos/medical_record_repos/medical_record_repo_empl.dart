import 'package:dio/dio.dart';

import '../../models/medical_record_models/medical_record_model.dart';
import 'medical_record_repo.dart';

class MedicalRecordRepositoryImpl implements MedicalRecordRepository {
  final Dio dio = Dio();
  static const String baseUrl = 'http://smilesimulation.runasp.net/api/MedicalHistory';

  @override
  Future<List<MedicalRecord>?> fetchMedicalRecords(String patientId) async {
    try {
      final response = await dio.get('$baseUrl/$patientId');
      if (response.statusCode == 200) {
        final data = response.data;
        if (data['success'] == true) {
          final records = (data['data'] as List<dynamic>?)
              ?.map((json) => MedicalRecord.fromJson(json))
              .toList();
          return records ?? [];
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}