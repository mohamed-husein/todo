import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:todo/model/task_model.dart';
import 'package:todo/view/screens/add_task_screen.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:todo/view/screens/task_description.dart';

class NotificationsHelper {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future initializeNotification() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    _configureLocalTimeZone();
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
  }

  void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      debugPrint('notification payload: $payload');
    }
    await Get.to(NotifiedPage(
      label: payload!,
    ));
  }

  /// int hour, int minute, TaskModel task
  void schedulingNotifications(int hour, int minutes, TaskModel task) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        task.id!.toInt(),
        task.title,
        task.note,
        _convertTime(hour, minutes),
        // tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
        const NotificationDetails(
            android: AndroidNotificationDetails(
                sound: RawResourceAndroidNotificationSound('notification'),
                'my channel id2',
                'my channel name',
                channelDescription: 'my channel description',
                playSound: true)),
        androidAllowWhileIdle: true,
        matchDateTimeComponents: DateTimeComponents.time,
        payload: "${task.title}|${task.note}|",
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  tz.TZDateTime _convertTime(int hour, int minutes) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduleDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minutes);
    if (scheduleDate.isBefore(now)) {
      scheduleDate = scheduleDate.add(const Duration(days: 1));
    }
    return scheduleDate;
  }

  Future<void> _configureLocalTimeZone() async {
    tz.initializeTimeZones();
    final String timeZone = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZone));
  }

  void displayNotifications(
      {required String title, required String body}) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('your channel id', 'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            sound: RawResourceAndroidNotificationSound('notification'),
            playSound: true,
            ticker: 'ticker');
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin
        .show(0, title, body, notificationDetails, payload: 'item x');
  }
}
