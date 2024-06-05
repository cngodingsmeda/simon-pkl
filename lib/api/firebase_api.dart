import 'dart:async';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class FirebaseAPI {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  final notifications = FlutterLocalNotificationsPlugin();
  // static RxList notifPage = [].obs;
  static var titleNotif = "".obs;
  static var bodyNotif = "".obs;

  // Inisialisasi notifikasi
  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    await analytics.logEvent(name: 'init_notifications');
    var androidSetting =
        const AndroidInitializationSettings('launch_background');

    var initializationSettings = InitializationSettings(
      android: androidSetting,
    );
    await notifications.initialize(
      initializationSettings,
    );
  }



  Future<void> init() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      const AndroidNotificationChannel channel = AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // name
        importance: Importance.max,
      );

      final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
          FlutterLocalNotificationsPlugin();

      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);
      await _firebaseMessaging.requestPermission();
      RemoteNotification notification = message.notification!;
      AndroidNotification? android = message.notification!.android;
      if (android != null) {
        print("channel.id: ${channel.id}");
        print(channel.description);
        print(android.channelId);
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                icon: "notifikasi_icon",
              ),
            ));
      }

      if (message.notification != null) {
        bodyNotif.value = message.notification!.body!;
        titleNotif.value = message.notification!.title!;
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Message clicked!');
    });
  }
}
