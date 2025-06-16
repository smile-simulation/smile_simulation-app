class MedicalRecord {
  final int id;
  final String date;
  final String doctorId;
  final String doctorName;
  final String patientId;
  final String patientName;
  final String prescription;
  final Map<String, dynamic> procedureSelections;
  final List<String> fileUrls;
  final String additionalNotes;

  MedicalRecord({
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