import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:simon_pkl/app/modules/login/controllers/login_controller.dart';
import 'package:simon_pkl/app/modules/snapshot/views/snapshot_view.dart';
import 'package:simon_pkl/material/material.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await initializeDateFormatting();

  Get.put(LoginController()); // Ensure LoginController is put here only once

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Locale("id"),
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
            final auth = Get.find<LoginController>();
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
