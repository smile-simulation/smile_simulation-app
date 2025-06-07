import 'dart:convert';

class VisitReminder {
  final String id;
  final String name;
  final String date;
  final String time;
  final String? imagePath;

  VisitReminder({
    required this.id,
    required this.name,
    required this.date,
    required this.time,
    this.imagePath,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'date': date,
      'time': time,
      'imagePath': imagePath,
    };
  }

  factory VisitReminder.fromJson(Map<String, dynamic> json) {
    return VisitReminder(
      id: json['id'],
      name: json['name'],
      date: json['date'],
      time: json['time'],
      imagePath: json['imagePath'],
    );
  }

  static List<VisitReminder> fromJsonList(String jsonString) {
    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((json) => VisitReminder.fromJson(json)).toList();
  }

  static String toJsonList(List<VisitReminder> reminders) {
    return jsonEncode(reminders.map((r) => r.toJson()).toList());
  }
}