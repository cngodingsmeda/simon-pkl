import 'dart:convert';

import 'package:get/get.dart';
import "package:http/http.dart" as http;
import 'package:simon_pkl/app/routes/app_pages.dart';
import 'package:simon_pkl/material/material.dart';

class LokasiPklController extends GetxController {
  @override
  void onInit() {
    Get.reload<LokasiPklController>();
    super.onInit();
  }
  String tampungToken = AllMaterial.box.read("token");
  static const getDudiUrl = "http://10.0.2.2:2008/siswa/getDudiFilter?page=1";

  Future<dynamic> fetchData() async {
    final response = await http.get(
      Uri.parse(getDudiUrl),
      headers: {
        "Authorization": "Bearer $tampungToken",
      },
    );
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      Get.toNamed(Routes.LOKASI_PKL);
      AllMaterial.box.write("dataPrevDudi", data["data"]["dudi"]);
      print(data["data"]);
    } else {
      throw Exception('Error min');
    }
  }
}
