import 'dart:io';

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
  }@override
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
      ) async {
    // تهيئة FormData
    FormData formData = FormData();

    // إضافة الحقول النصية
    formData.fields.addAll([
      MapEntry('DoctorId', doctorId),
      MapEntry('Username', username),
      MapEntry('Prescription', prescription),
      MapEntry('AdditionalNotes', additionalNotes),
    ]);

    // إضافة ProcedureSelections كحقول منفصلة
    formData.fields.addAll([
      MapEntry('ProcedureSelections.تنظيف', procedureSelectionsCleaning.toString()),
      MapEntry('ProcedureSelections.خلع', procedureSelectionsExtraction.toString()),
      MapEntry('ProcedureSelections.حشو', procedureSelectionsFilling.toString()),
      MapEntry('ProcedureSelections.تركيب', procedureSelectionsInstallation.toString()),
      MapEntry('ProcedureSelections.علاج_عصب', procedureSelectionsNerveTreatment.toString()),
      MapEntry('ProcedureSelections.أخرى', procedureSelectionsOther.toString()),
      MapEntry('ProcedureSelections.تركيب_جسور', procedureSelectionsBridgeInstallation.toString()),
      MapEntry('ProcedureSelections.صور', procedureSelectionsPhotos.toString()),
      MapEntry('ProcedureSelections.OtherDescription', procedureSelectionsOtherDescription ?? ''),
    ]);

    // إضافة الملفات إذا كانت موجودة
    if (files != null && files.isNotEmpty) {
      for (var file in files) {
        formData.files.add(MapEntry(
          'Files',
          await MultipartFile.fromFile(file.path, filename: file.path.split('/').last),
        ));
      }
    }

    try {
      final response = await dio.post(
        'http://smilesimulation.runasp.net/api/MedicalHistory',
        data: formData,
      );

      if (response.statusCode == 200) {
        return AddMedicalRecordResponse.fromJson(response.data);
      } else {
        throw Exception('فشل في إضافة السجل: ${response.statusCode} - ${response.data['message']}');
      }
    } catch (e) {
      throw Exception('خطأ في الاتصال: $e');
    }
  }
  Future<void> editMedicalRecord(int id, Map<String, dynamic> data) async {
    try {
      final formData = FormData.fromMap({
        'Prescription': data['prescription'] ?? '',
        'ProcedureSelections.تنظيف': data['procedureSelections']['تنظيف'] ?? false,
        'ProcedureSelections.خلع': data['procedureSelections']['خلع'] ?? false,
        'ProcedureSelections.حشو': data['procedureSelections']['حشو'] ?? false,
        'ProcedureSelections.تركيب': data['procedureSelections']['تركيب'] ?? false,
        'ProcedureSelections.علاج_عصب': data['procedureSelections']['علاج_عصب'] ?? false,
        'ProcedureSelections.أخرى': data['procedureSelections']['أخرى'] ?? false,
        'ProcedureSelections.OtherDescription': data['procedureSelections']['otherDescription'] ?? '',
        'AdditionalNotes': data['additionalNotes'] ?? '',
        if (data['files'] != null && data['files'].isNotEmpty)
          'Files': data['files'].map((file) => MultipartFile.fromFileSync(file.path, filename: file.path.split('/').last)).toList(),
      });

      final response = await dio.put(
        'http://smilesimulation.runasp.net/api/MedicalHistory/$id',
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to edit medical record: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception('Failed to edit medical record: $e');
    }
  }
}
