import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:simon_pkl/app/modules/login/controllers/login_controller.dart';
import 'package:simon_pkl/material/allmaterial.dart';

class HomeDudiController extends GetxController {
  var tokenLoginDudi = AllMaterial.box.read("token");
  var getDataDudi = "http://10.0.2.2:2008/pembimbingDudi/getPembimbingDudi";
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

  Future<void> fetchDataDudi() async {
    final response = await http.get(
      Uri.parse(getDataDudi),
      headers: {
        "Authorization": "Bearer $tokenLoginDudi",
      },
    );
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      AllMaterial.box.write("dataDudi", data["data"]);
    } else {
      // AllMaterial.alertSimon(msg: "Kesalahan", msgC: "Data tidak boleh kosong");
    }
  }
}
