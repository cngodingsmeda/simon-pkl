import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseAPI {
  final firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true
    );
  }

  void getToken() async {
    var fcmToken = await FirebaseMessaging.instance.getToken();
    print(fcmToken);
  }
}
