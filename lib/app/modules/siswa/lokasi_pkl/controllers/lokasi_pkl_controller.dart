import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:simon_pkl/app/modules/login/controllers/login_controller.dart';
import 'dart:convert';
import 'package:simon_pkl/material/allmaterial.dart';

class LokasiPklController extends GetxController {
  var dataPrevDudi = <dynamic>[];
  var intPage = 0.obs;
  var dataCountPage = 0.obs;

  String tampungToken = LoginController.tokenLogin.value;
  String get getDudiUrl =>
      "http://10.0.2.2:2008/siswa/getDudiFilter?page=${intPage.value + 1}";
  String postAjuanPKLUrl = "http://10.0.2.2:2008/siswa/pengajuanPkl";

  Future<void> postAjuanPKL(dynamic idDudi) async {
    try {
      final response = await http.post(
        Uri.parse(
          postAjuanPKLUrl,
        ),
        headers: {
          "Authorization": "Bearer $tampungToken",
        },
        body: {
          "id_dudi": "$idDudi",
        },
      );
      var data = jsonDecode(response.body);
        AllMaterial.box.write("idAjuanPKL", data["data"]["id"]);
      if (response.statusCode == 200) {
        print("data dudi pkl dipilih: ${response.body}");
        print("data id dudi pkl ${data["data"]["id"]}");
      } else {
        print(response.body);
        // print(response.statusCode);
      }
    } catch (e) {
      print('Exception: $e');
      print("error di post ajuan pkl");
      throw Exception('Error: $e');
    }
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse(getDudiUrl),
        headers: {
          "Authorization": "Bearer $tampungToken",
        },
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        AllMaterial.box.write("dataPage", data["data"]["page"]);
        AllMaterial.box.write("dataCount", data["data"]["count"]);
        dataCountPage.value = data["data"]["countPage"];
        dataPrevDudi.assignAll(data["data"]["dudi"]);
      } else {
        print('Error response body: ${response.body}');
        throw Exception(
          'Failed to load data. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      print('Exception: $e');
      throw Exception('Error: $e');
    }
  }

  void changePage(int page) async {
    intPage.value = page;
    await fetchData();
  }

  @override
  void onInit() async {
    super.onInit();
    fetchData();
  }
}
