import 'dart:convert';

import 'package:get/get.dart';

import 'package:simon_pkl/app/modules/login/controllers/login_controller.dart';

import 'package:http/http.dart' as http;
import 'package:simon_pkl/material/allmaterial.dart';

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
