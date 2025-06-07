// lib/core/services/local_notification_service.dart
import 'dart:developer';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';

import 'dart:io' show Platform;

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  /// Callback for foreground notification tap
  static void Function(NotificationResponse response)?
  onDidReceiveNotificationResponse = (response) {
    log('Notification tapped: ${response.payload}');
  };

  /// Callback for background tap (MUST be a static top-level function)
  @pragma('vm:entry-point')
  static void backgroundNotificationHandler(NotificationResponse response) {
    log('Background notification tapped: ${response.payload}');
  }

  /// Initialize notifications with timezone and channels
  static Future<void> initialize() async {
    tz.initializeTimeZones();
    try {
      final String timeZoneName = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(timeZoneName));
      log('Timezone set to: $timeZoneName');
    } catch (e) {
      log('Error setting timezone: $e');
      tz.setLocalLocation(tz.getLocation('UTC'));
    }

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
          requestAlertPermission: true,
          requestBadgePermission: true,
          requestSoundPermission: true,
        );

    const InitializationSettings initializationSettings =
        InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS,
        );

    try {
      await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
        onDidReceiveBackgroundNotificationResponse:
            backgroundNotificationHandler,
      );
      log('Notification plugin initialized!');
    } catch (e) {
      log('Initialization error: $e');
    }

    if (Platform.isAndroid) {
      const AndroidNotificationChannel channel1 = AndroidNotificationChannel(
        'id_1',
        'Smile Simulation Notifications',
        description: 'Channel for local notifications',
        importance: Importance.max,
        playSound: true,
      );
      const AndroidNotificationChannel channel2 = AndroidNotificationChannel(
        'id_2',
        'Smile Simulation Repeated Notifications',
        description: 'Channel for repeated local notifications',
        importance: Importance.max,
        playSound: true,
      );

      const AndroidNotificationChannel reminderChannel =
          AndroidNotificationChannel(
            'reminder_channel',
            'Drug Reminders',
            description: 'Notifications for drug reminders',
            importance: Importance.max,
            playSound: true,
          );
      final androidPlugin =
          flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin
              >();
      await androidPlugin?.createNotificationChannel(channel1);
      await androidPlugin?.createNotificationChannel(channel2);
      await androidPlugin?.createNotificationChannel(reminderChannel);
    }
  }

  /// Request notification and scheduling permissions
  static Future<void> requestNotificationPermission() async {
    if (Platform.isAndroid) {
      var status = await Permission.notification.status;
      if (!status.isGranted) {
        await Permission.notification.request();
      }

      final androidPlugin =
          flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin
              >();
      await androidPlugin?.requestExactAlarmsPermission();
    }

    if (Platform.isIOS) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin
          >()
          ?.requestPermissions(alert: true, badge: true, sound: true);
    }
  }

  /// Send immediate notification
  static Future<void> sendLocalNotification({
    required String title,
    required String body,
    String? payload,
  }) async {
    const NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'id_1',
        'Smile Simulation Notifications',
        channelDescription: 'Channel for local notifications',
        importance: Importance.max,
        priority: Priority.high,
        playSound: true,
      ),
      iOS: DarwinNotificationDetails(),
    );
    await flutterLocalNotificationsPlugin.show(
      1,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }

  /// Schedule weekly reminder notification
  static Future<void> scheduleReminderNotification({
    required int id,
    required String title,
    required String body,
    required tz.TZDateTime scheduledDate,
    required String payload,
  }) async {
    const NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'reminder_channel',
        'Drug Reminders',
        channelDescription: 'Notifications for drug reminders',
        importance: Importance.max,
        priority: Priority.high,
        playSound: true,
      ),
      iOS: DarwinNotificationDetails(),
    );
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      scheduledDate,
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
      payload: payload,
    );
    log('Scheduled notification $id for $scheduledDate');
  }

  /// Cancel notification by ID
  static Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
    log('Canceled notification $id');
  }

  /// Test notification
  static Future<void> showTestNotification() async {
    await sendLocalNotification(
      title: 'Test Notification',
      body: 'This is a test notification from Smile Simulation',
      payload: 'test',
    );
  }

  static Future<void> showScheduledNotification({
    required DateTime dateTime,
    required String body,
    required String title,
  }) async {
    const AndroidNotificationDetails android = AndroidNotificationDetails(
      'scheduled_notification',
      'id_3',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails details = NotificationDetails(android: android);

    // Initialize timezone if not already done elsewhere
    tz.initializeTimeZones();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));

    final tz.TZDateTime tzDateTime = tz.TZDateTime.from(dateTime, tz.local);

    log('Scheduled for: $tzDateTime (${tz.local.name})');

    await flutterLocalNotificationsPlugin.zonedSchedule(
      2,
      title,
      body,
      tzDateTime,
      details,
      payload: 'zonedSchedule',
      androidScheduleMode: AndroidScheduleMode.exact,
    );
  }

  static Future<void> scheduleNotification({
    required DateTime dateTime,
    required String title,
    required String body,
    required String payload,
    bool isRepeating = false,
    int id = 0,
  }) async {
    // Initialize timezones
    tz.initializeTimeZones();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));

    // تحويل DateTime إلى TZDateTime
    tz.TZDateTime tzDateTime = tz.TZDateTime.from(dateTime, tz.local);

    // لو الوقت عدى والتكرار مطلوب، زوده أسبوع
    if (isRepeating && tzDateTime.isBefore(tz.TZDateTime.now(tz.local))) {
      tzDateTime = tzDateTime.add(const Duration(days: 7));
    }

    const NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'unified_channel',
        'Unified Notifications',
        channelDescription: 'Handles both one-time and repeating notifications',
        importance: Importance.max,
        priority: Priority.high,
        playSound: true,
      ),
      iOS: DarwinNotificationDetails(),
    );

    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tzDateTime,
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      payload: payload,
      matchDateTimeComponents:
          isRepeating ? DateTimeComponents.dayOfWeekAndTime : null,
    );

    log(
      'Scheduled ${isRepeating ? "repeating" : "one-time"} notification for $tzDateTime',
    );
  }
}
