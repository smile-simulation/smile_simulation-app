class Patient {
  final String success;
  final String message;


  Patient({
    required this.success,
    required this.message,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      success: json['success'].toString(),
      message: json['message'].toString(),
    );
  }
}