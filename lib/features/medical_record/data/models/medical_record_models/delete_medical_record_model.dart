class DeleteMedicalRecordResponse {
  final bool success;
  final String message;

  DeleteMedicalRecordResponse({
    required this.success,
    required this.message,
  });

  factory DeleteMedicalRecordResponse.fromJson(Map<String, dynamic> json) {
    return DeleteMedicalRecordResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
    );
  }
}