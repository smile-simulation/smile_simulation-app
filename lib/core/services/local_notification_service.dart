import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlatform =
      FlutterLocalNotificationsPlugin();
  static void Function(NotificationResponse response)?
  onDidReceiveNotificationResponse = (response) {};

  /// Callback for background tap
  @pragma('vm:entry-point')
  static void Function(NotificationResponse )?
  onDidReceiveBackgroundNotificationResponse(response) {}
  static Future<void> initialize() async {
    InitializationSettings initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/launcher_icon'),
      iOS: DarwinInitializationSettings(),
    );

    flutterLocalNotificationsPlatform.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
      onDidReceiveBackgroundNotificationResponse:
          onDidReceiveBackgroundNotificationResponse,
    );
  }
}
