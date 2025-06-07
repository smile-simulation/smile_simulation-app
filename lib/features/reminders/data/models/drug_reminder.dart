import 'dart:convert';

class DrugReminder {
  final String id;
  final String drugName;
  final String frequency;
  final String dosage;
  final String time;
  final String mealTiming;
  final String stopDate;
  final List<bool> daysSelected;
  final String? imagePath;

  DrugReminder({
    required this.id,
    required this.drugName,
    required this.frequency,
    required this.dosage,
    required this.time,
    required this.mealTiming,
    required this.stopDate,
    required this.daysSelected,
    this.imagePath,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'drugName': drugName,
      'frequency': frequency,
      'dosage': dosage,
      'time': time,
      'mealTiming': mealTiming,
      'stopDate': stopDate,
      'daysSelected': daysSelected,
      'imagePath': imagePath,
    };
  }

  factory DrugReminder.fromJson(Map<String, dynamic> json) {
    return DrugReminder(
      id: json['id'],
      drugName: json['drugName'],
      frequency: json['frequency'],
      dosage: json['dosage'],
      time: json['time'],
      mealTiming: json['mealTiming'],
      stopDate: json['stopDate'],
      daysSelected: List<bool>.from(json['daysSelected']),
      imagePath: json['imagePath'],
    );
  }

  static List<DrugReminder> fromJsonList(String jsonString) {
    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((json) => DrugReminder.fromJson(json)).toList();
  }

  static String toJsonList(List<DrugReminder> reminders) {
    return jsonEncode(reminders.map((r) => r.toJson()).toList());
  }
}