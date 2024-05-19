import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:net_carbons/main.dart';
import 'package:net_carbons/notification/initialization_settings.dart';
import 'package:net_carbons/notification/notification_helpers.dart';
import 'package:net_carbons/presentation/profile/child_screens/settings/screen_settings.dart';
import 'package:permission_handler/permission_handler.dart';

bool isFlutterLocalNotificationsInitialized = false;

@pragma('vm:entry-point')
void onDidReceiveBackgroundNotificationResponse(NotificationResponse res) {
  flutterLocalNotificationsPlugin
      .getNotificationAppLaunchDetails()
      .then((value) => print(value));
  print("onDidReceiveBackgroundNotificationResponse");
  print(res);
  navigatorKey.currentState
      ?.push(MaterialPageRoute(builder: (_) => ScreenSettings()));
}

@pragma('vm:entry-point')
void onDidReceiveNotificationResponse(NotificationResponse res) {
  print("onDidReceiveNotificationResponse");
  print(res.notificationResponseType);

  navigatorKey.currentState
      ?.push(MaterialPageRoute(builder: (_) => ScreenSettings()));
}

Future<void> setupFlutterNotifications() async {
  if (isFlutterLocalNotificationsInitialized) {
    return;
  }
  await _getPermission();

  final details =
      await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
  if (details != null) {
    if (details.didNotificationLaunchApp) {
      //onClickNotification.add(details);
    }
  }

  flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveBackgroundNotificationResponse:
        onDidReceiveBackgroundNotificationResponse,
    onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
  );

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(defaultChannel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  isFlutterLocalNotificationsInitialized = true;
}

Future<void> _getPermission() async {
  final status = await Permission.notification.status;
  if (status == PermissionStatus.granted ||
      status == PermissionStatus.permanentlyDenied) {
    return;
  } else {
    Permission.notification.request();
  }
}
