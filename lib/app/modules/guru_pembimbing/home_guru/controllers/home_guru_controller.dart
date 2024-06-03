import 'dart:convert';

import 'package:get/get.dart';
import 'package:simon_pkl/app/modules/login/controllers/login_controller.dart';
import 'package:simon_pkl/material/allmaterial.dart';
import 'package:http/http.dart' as http;

class HomeGuruController extends GetxController {
  var tokenLoginGuru = AllMaterial.box.read("token");
  var getDataGuru = "http://10.0.2.2:2008/guruPembimbing/getProfile";
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

  Future<void> fetchDataGuru() async {
    final response = await http.get(
      Uri.parse(getDataGuru),
      headers: {
        "Authorization": "Bearer $tokenLoginGuru",
      },
    );
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      AllMaterial.box.write("dataGuru", data["data"]);
    } else {
       AllMaterial.waitPage();
    }
  }
}
