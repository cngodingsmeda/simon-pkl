import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:simon_pkl/api/firebase_api.dart';
import 'package:simon_pkl/app/modules/login/controllers/login_controller.dart';
import 'package:simon_pkl/app/modules/siswa/profile_page/snapshot/views/snapshot_view.dart';
import 'package:simon_pkl/material/allmaterial.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await initializeDateFormatting();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'apikey',
      appId: 'appId',
      messagingSenderId: 'messagingSenderId',
      projectId: 'projectId',
      storageBucket: 'storageBucket',
    ),
  );
  await FirebaseAPI().initNotifications();
  await Get.put(LoginController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: AllMaterial.fontFamily),
      locale: Locale("id", "ID"),
      showSemanticsDebugger: false,
      debugShowCheckedModeBanner: false,
      home: Home(),
      getPages: AppPages.routes,
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 3)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            final auth = Get.put(LoginController());
            auth.loginPage();
          });
          return AllMaterial.waitPage();
        } else {
          return SnapshotView();
        }
      },
    );
  }
}
