import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static void Function(NotificationResponse response)?
  onDidReceiveNotificationResponse = (response) {};

  /// Callback for background tap
  @pragma('vm:entry-point')
  static void Function(NotificationResponse)?
  onDidReceiveBackgroundNotificationResponse(response) {
    log("Local Notitfation");
    return null;
  }

  static Future<void> initialize() async {
    InitializationSettings initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/launcher_icon'),
      iOS: DarwinInitializationSettings(),
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
      onDidReceiveBackgroundNotificationResponse:
          onDidReceiveBackgroundNotificationResponse,
    );
  }

  static Future<void> sendLocalNotification({
    required String title,
    required String body,
  }) async {
    NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        "id_1", // خلي الـ id ما فيه مسافات عشان الأندرويد بيحب الأسامي النضيفة
        "Smile Simulation Notifications",
        channelDescription: "Channel for local notifications",
        icon: '@mipmap/launcher_icon',
        importance: Importance.max,
        priority: Priority.max,
        playSound: true,
      ),
    );
    await flutterLocalNotificationsPlugin.show(
      1,
      title,
      body,
      notificationDetails,
    );
  }

  Future<void> requestNotificationPermission() async {
    var status = await Permission.notification.status;
    if (!status.isGranted) {
      await Permission.notification.request();
    }
  }

  static Future<void> repeatedNotification() async {
    log("repeatedNotification");
    NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        "id_2", // خلي الـ id ما فيه مسافات عشان الأندرويد بيحب الأسامي النضيفة
        "Smile Simulation repeated Notifications",
        channelDescription: "Channel for repeated local notifications",
        icon: '@mipmap/launcher_icon',
        importance: Importance.max,
        priority: Priority.max,
        playSound: true,
      ),
    );
    RepeatInterval repeatInterval = RepeatInterval.everyMinute;
    AndroidScheduleMode androidScheduleMode =
        AndroidScheduleMode.exactAllowWhileIdle;
    flutterLocalNotificationsPlugin.periodicallyShow(
      2,
      "Repeated Local Notification",
      "Repeated Local notification on smile simulation app",
      repeatInterval,
      notificationDetails,
      androidScheduleMode: androidScheduleMode,
    );
    log("repeatedNotification2");
  }
}
