import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:net_carbons/notification/set_up_notification.dart';
import 'package:net_carbons/presentation/resources/color.dart';

import 'constants_classes.dart';
import 'notification_helpers.dart';

void showFlutterNotification(RemoteMessage message) {
  setupFlutterNotifications();
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;

  if (!kIsWeb) {
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification?.title,
      notification?.body,
      NotificationDetails(
          android: AndroidNotificationDetails(

            android?.channelId ?? NotificationString.defaultChannelId,
            NotificationString.defaultChannelName,

            channelDescription: NotificationString.defaultChannelDesc,
            color: AppColors.greenAccent6,
          ),
          iOS: const DarwinNotificationDetails()),
    );
  }
}
