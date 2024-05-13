import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:simon_pkl/app/modules/login/controllers/login_controller.dart';
import 'package:simon_pkl/app/modules/siswa/beranda_page/views/beranda_page_view.dart';
import 'package:simon_pkl/app/modules/siswa/laporan_page/views/laporan_page_view.dart';
import 'package:http/http.dart' as http;
import 'package:simon_pkl/material/material.dart';

class HomeSiswaController extends GetxController {
  var tokenLoginSiswa = AllMaterial.box.read("token");
  var getDataSiswa = "http://10.0.2.2:2008/siswa/getProfile";
  // Beranda
  var loginC = LoginController();
  @override
  void onInit() {
    loginC.textBodyC.clear();
    loginC.pwC.clear();
    super.onInit();
  }

  RxInt indexWidget = 0.obs;
  void changeIndexBottomNav(int index) {
    indexWidget.value = index;
  }

  List<Widget> myPage = [
    // BERANDA
    BerandaPageView(),
    // LAPORAN
    const LaporanPageView(),
    // NOTIFIKASI
  ];

  // Profile
  Future<void> fetchDataSiswa() async {
    final response = await http.get(
      Uri.parse(getDataSiswa),
      headers: {
        "Authorization": "Bearer $tokenLoginSiswa",
      },
    );
    print(response.statusCode);
    print(response.body);
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      AllMaterial.box.write("dataSiswa", data["data"]);
    } else {
      AllMaterial.alertSimon(msg: "Kesalahan", msgC: "Data tidak boleh kosong");
    }
  }
}
