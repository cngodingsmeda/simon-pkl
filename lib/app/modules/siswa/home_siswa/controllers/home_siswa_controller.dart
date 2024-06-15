import 'dart:convert';

import 'package:get/get.dart';

import 'package:simon_pkl/app/modules/login/controllers/login_controller.dart';

import 'package:http/http.dart' as http;
// import 'package:simon_pkl/app/modules/siswa/beranda_page/controllers/beranda_page_controller.dart';
import 'package:simon_pkl/app/modules/siswa/beranda_page/views/beranda_page_view.dart';
// import 'package:simon_pkl/app/modules/siswa/beranda_page/views/beranda_page_view.dart';
import 'package:simon_pkl/material/allmaterial.dart';

class HomeSiswaController extends GetxController {
  var tokenLoginSiswa = AllMaterial.box.read("token");
  var getDataSiswa = "http://10.0.2.2:2008/siswa/getProfile";
  // Beranda
  var loginC = LoginController();
  @override
  void onInit() async {
    loginC.textBodyC.clear();
    loginC.pwC.clear();
    super.onInit();
    fetchDataSiswa();
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
    print("fetchDataSiswa: ${ response.statusCode}");
    print("fetchDataSiswa body: ${response.body}");
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print("FetchDataSiswa data: ${data["data"]}");
      AllMaterial.box.write("dataSiswa", data["data"]);
      BerandaPageView.indexWidget.value = data["data"]["status"];
    } else {
    }
  }
}
