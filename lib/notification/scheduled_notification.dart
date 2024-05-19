import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:net_carbons/notification/constants_classes.dart';
import 'package:net_carbons/notification/notification_helpers.dart';
import 'package:timezone/timezone.dart' as tz;

import 'package:timezone/data/latest_all.dart' as tzdata;

Future<void> scheduleNotificationAfter30Days() async {
  flutterLocalNotificationsPlugin.cancel(MonthlyNotificationConstants.id);
  print("Notification scheduled");
  tzdata.initializeTimeZones();
  final locationString = await FlutterTimezone.getLocalTimezone();
  final location = tz.getLocation(locationString);
  flutterLocalNotificationsPlugin.zonedSchedule(
    MonthlyNotificationConstants.id,
    "Reminder",
    "You have not reduced your emission for a month! Please open netcarbons and be a part of this mission",
    tz.TZDateTime.now(location).add(const Duration(days: 30)),
    const NotificationDetails(
      android: AndroidNotificationDetails(
        NotificationString.defaultChannelId,
        NotificationString.defaultChannelName,
      ),
    ),
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
    androidAllowWhileIdle: true, // Depending on your requirement
  );
}

// Future<void> scheduleNotificationAfter30Days() async {
//   flutterLocalNotificationsPlugin.cancel(MonthlyNotificationConstants.id);
//   print("Notificatio scheduled");
//   final locationString = await FlutterTimezone.getLocalTimezone();
//   flutterLocalNotificationsPlugin.zonedSchedule(
//       MonthlyNotificationConstants.id,
//       "Reminder",
//       "You have not reduced your emission for a month! Please open netcarbons and be a part of this mission",
//       tz.TZDateTime.now(tz.getLocation(locationString))
//           .add(const Duration(days: 30)),
//       const NotificationDetails(
//           android: AndroidNotificationDetails(
//               NotificationString.defaultChannelId,
//               NotificationString.defaultChannelName)),
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//       androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle);
// }

Future<void> showANotification() async {
  flutterLocalNotificationsPlugin.show(
      1,
      'title',
      'body',
      const NotificationDetails(
        android: AndroidNotificationDetails(NotificationString.defaultChannelId,
            NotificationString.defaultChannelName),
      ),
      payload: "PAYLOAD");
}

//DateTime.now().add(Duration(days: 30))
