import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:simon_pkl/app/modules/dudi/home_dudi/views/home_dudi_view.dart';
import 'package:simon_pkl/app/modules/guru_pembimbing/home_guru/views/home_guru_view.dart';
import 'package:simon_pkl/app/modules/login/controllers/login_controller.dart';
import 'package:simon_pkl/app/modules/login/views/login_view.dart';
import 'package:simon_pkl/app/modules/siswa/home_siswa/views/home_siswa_view.dart';
import 'package:simon_pkl/app/modules/snapshot/views/snapshot_view.dart';
import 'package:simon_pkl/material/material.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await initializeDateFormatting();
  Get.put(LoginController());
  runApp(
    GetMaterialApp(
      locale: Locale("id"),
      showSemanticsDebugger: false,
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: Future.delayed(const Duration(seconds: 3)),
        builder: (context, snapshot) {
          Get.reload<LoginController>(force: true);
          if (snapshot.connectionState == ConnectionState.done) {
            final auth = Get.find<LoginController>();
            return FutureBuilder(
              future: auth.autoLogin(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (auth.dataAuth != null && auth.dataLoginDudi != null) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Get.reloadAll();
                      Get.offAll(() => HomeDudi());
                    });
                  } else if (auth.dataAuth != null &&
                      auth.dataLoginSiswa != null) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Get.reloadAll();
                      Get.offAll(() => HomeSiswa());
                    });
                  } else if (auth.dataAuth != null &&
                      auth.dataLoginGuru != null) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Get.reloadAll();
                      Get.offAll(() => HomeGuruView());
                    });
                  } else {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Get.reloadAll();
                      Get.offAll(() => LoginView());
                    });
                  }
                } else if (snapshot.hasError) {
                  print(snapshot.error);
                }
                return Scaffold(
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(color: AllMaterial.colorBlue),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Harap Tunggu Sebentar...",
                          style: TextStyle(
                            fontFamily: AllMaterial.fontFamily,
                            fontSize: 18,
                            fontWeight: AllMaterial.fontMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return SnapshotView();
          }
        },
      ),
      getPages: AppPages.routes,
    ),
  );
}
