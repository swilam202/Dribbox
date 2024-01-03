import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initalize() async {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('icon');
    const DarwinInitializationSettings darwinInitializationSettings =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidInitializationSettings,
      iOS: darwinInitializationSettings,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<NotificationDetails> notificationDetails() async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      channelDescription: 'channel_description',
      importance: Importance.max,
      enableVibration: true,
      enableLights: true,
      priority: Priority.max,
    );
    DarwinNotificationDetails darwinNotificationDetails =
        const DarwinNotificationDetails();
    return NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);
  }

  showNotifications(int id, String title, String body) async {
    NotificationDetails details = await notificationDetails();
    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      details,
    );
  }
}
