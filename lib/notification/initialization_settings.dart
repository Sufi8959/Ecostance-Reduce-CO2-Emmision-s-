import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:net_carbons/notification/constants_classes.dart';

InitializationSettings initializationSettings = const InitializationSettings(
  android: AndroidInitializationSettings('ic_notification'),
  iOS: DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: false,
      requestSoundPermission: false,
      notificationCategories: [
        DarwinNotificationCategory(
          'cart_reminder',
        ),
      ]),
);

AndroidNotificationChannel defaultChannel = const AndroidNotificationChannel(
  NotificationString.defaultChannelId, // id
  NotificationString.defaultChannelName, // title
  description: NotificationString.defaultChannelDesc, // description
  importance: Importance.high,
);
