import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart'; // Import permission handler

class NotificationService {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  // Initialize notification settings and request runtime permissions if needed
  Future<void> initNotifications() async {
    log("Initializing notifications service");

    // Android notification initialization settings
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);

    // Initialize notifications
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    // Request notification permission on Android 13+ (API 33+)
    if (await Permission.notification.isDenied) {
      log("Notification permission denied, requesting permission.");
      await Permission.notification.request();
    } else if (await Permission.notification.isPermanentlyDenied) {
      log("Notification permission is permanently denied.");
      // You could navigate to the app settings if permanently denied
      openAppSettings();
    } else {
      log("Notification permission already granted.");
    }
  }

  // Function to show notification
  Future<void> showNotification(String title, String body) async {
    log("Showing notification");

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'donation_channel', // Channel ID
      'Donation Requests', // Channel Name
      channelDescription: 'Channel for donation request notifications',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0, // Notification ID
      title,
      body,
      platformChannelSpecifics,
    );
  }
}
