class MedicalRecord {
  final int id;
  final String date;
  final String doctorId;
  final String doctorName;
  final String patientId;
  final String userName;
  final String patientName;
  final String prescription;
  final Map<String, dynamic> procedureSelections;
  final List<String> fileUrls;
  final String additionalNotes;

  MedicalRecord( {required this.userName,
    required this.id,
    required this.date,
    required this.doctorId,
    required this.doctorName,
    required this.patientId,

    required this.patientName,
    required this.prescription,
    required this.procedureSelections,
    required this.fileUrls,
    required this.additionalNotes,
  });

  factory MedicalRecord.fromJson(Map<String, dynamic> json) {
    return MedicalRecord(
      userName: json['userName'] ?? '',
      id: json['id'] ?? 0,
      date: json['date'] ?? '',
      doctorId: json['doctorId'] ?? '',
      doctorName: json['doctorName'] ?? '',
      patientId: json['patientId'] ?? '',
      patientName: json['patientName'] ?? '',
      prescription: json['prescription'] ?? '',
      procedureSelections: (json['procedureSelections'] as Map<String, dynamic>?) ?? {},
      fileUrls: (json['fileUrls'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
      additionalNotes: json['additionalNotes'] ?? '',
    );
  }
}
class AddMedicalRecordResponse {
  final bool success;
  final String message;

  AddMedicalRecordResponse({
    required this.success,
    required this.message,
  });

  factory AddMedicalRecordResponse.fromJson(Map<String, dynamic> json) {
    return AddMedicalRecordResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
    );
  }
}