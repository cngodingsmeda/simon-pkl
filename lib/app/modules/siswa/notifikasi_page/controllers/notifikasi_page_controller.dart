import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotifikasiPageController extends GetxController {
  var notifications = <Map<String, String>>[].obs;

  @override
  void onInit() {
    super.onInit();
    FirebaseMessaging.instance.getInitialMessage();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        notifications.add({
          "title": message.notification!.title ?? "No Title",
          "body": message.notification!.body ?? "No Body",
        });
        print("Notification Added: ${message.notification!.title} - ${message.notification!.body}");
        print("Current Notifications List Length: ${notifications.length}");
      }
    });
  }
}
