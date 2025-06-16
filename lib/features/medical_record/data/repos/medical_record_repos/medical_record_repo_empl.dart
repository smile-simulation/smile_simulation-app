import 'package:dio/dio.dart';

import '../../models/medical_record_models/delete_medical_record_model.dart';
import '../../models/medical_record_models/medical_record_model.dart';
import 'medical_record_repo.dart';

class MedicalRecordRepositoryImpl implements MedicalRecordRepository {
  final Dio dio = Dio();
  static const String baseUrl =
      'http://smilesimulation.runasp.net/api/MedicalHistory';

  @override
  Future<DeleteMedicalRecordResponse> deleteMedicalRecord(
    int historyId,
    String userName,
  ) async {
    final response = await dio.delete(
      'http://smilesimulation.runasp.net/api/MedicalHistory?Username=$userName&historyId=$historyId&patientId=$historyId',
    );

    if (response.statusCode == 200) {
      final jsonResponse = response.data;
      return DeleteMedicalRecordResponse.fromJson(jsonResponse);
    } else {
      throw Exception('فشل في حذف السجل: ${response.statusCode}');
    }
  }

  @override
  Future<List<MedicalRecord>?> fetchMedicalRecords(String patientId) async {
    try {
      final response = await dio.get('$baseUrl/$patientId');
      if (response.statusCode == 200) {
        final data = response.data;
        if (data['success'] == true) {
          final records =
              (data['data'] as List<dynamic>?)
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
