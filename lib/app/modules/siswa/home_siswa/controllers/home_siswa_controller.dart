import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/app/modules/login/controllers/login_controller.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;
import 'package:http/http.dart' as http;
import 'package:simon_pkl/app/modules/siswa/beranda_page/controllers/beranda_page_controller.dart';
import 'package:simon_pkl/app/modules/siswa/beranda_page/views/beranda_page_view.dart';
import 'package:simon_pkl/app/modules/siswa/profile_page/views/profile_page_view.dart';
import 'package:simon_pkl/material/allmaterial.dart';
import 'package:geolocator/geolocator.dart';

class HomeSiswaController extends GetxController {
  var tokenLoginSiswa = AllMaterial.box.read("token");
  var getDataSiswaUrl = "http://10.0.2.2:2008/siswa/getProfile";
  var postRadiusKoordinatUrl = "http://10.0.2.2:2008/siswa/cekRadiuskoordinat";
  // Beranda
  var loginC = LoginController();
  @override
  void onInit() {
    loginC.textBodyC.clear();
    loginC.pwC.clear();
    super.onInit();
    if (ProfilePageView.getDataSiswa.isFalse) {
      fetchDataSiswa();
    }
  }

  RxInt indexWidget = 0.obs;
  void changeIndexBottomNav(int index) {
    indexWidget.value = index;
  }

  // Profile
  Future<void> fetchDataSiswa() async {
    var controller = Get.put(LoginController());
    final response = await http.get(
      Uri.parse(getDataSiswaUrl),
      headers: {
        "Authorization": "Bearer $tokenLoginSiswa",
      },
    );
    print("fetchDataSiswa: ${response.statusCode}");
    print("fetchDataSiswa body: ${response.body}");
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print("FetchDataSiswa data: ${data["data"]}");
      AllMaterial.box.write("dataSiswa", data["data"]);
      BerandaPageView.indexWidget.value = data["data"]["status"];
      ProfilePageView.getDataSiswa.value = true;
      update();
    } else {
      controller.logout();
    }
  }

  Future<void> cekRadiusKoordinat(double latitude, longitude) async {
    try {
      final response = await http.post(
        Uri.parse(postRadiusKoordinatUrl),
        headers: {
          "Authorization": "Bearer $tokenLoginSiswa",
        },
        body: {
          "latitude": "$latitude",
          "longtitude": "$longitude",
        },
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        HomePageDua.statusRadius.value = data["data"]["insideRadius"];
        cekJenisAbsenSiswa(latitude, longitude);
      } else {
        Get.bottomSheet(
          BottomSheet(
            onClosing: () {},
            builder: (context) {
              return Container(
                decoration: BoxDecoration(
                  color: AllMaterial.colorWhite,
                  borderRadius: BorderRadius.circular(25),
                ),
                width: Get.width,
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kesalahan",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: AllMaterial.fontSemiBold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      toBeginningOfSentenceCase(
                        "${data["msg"]}!",
                      ),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(20),
              );
            },
          ),
        );
      }
    } catch (e) {
      print("error di cekRadiusKoordinat: $e");
    }
  }

  Future<void> cekJenisAbsenSiswa(double latitude, longitude) async {
    print("cekJenisAbsenSiswa dijalankan");
    var cekJenisAbsenUrl =
        "http://10.0.2.2:2008/siswa/cekAbsen?latitude=$latitude&longitude=$longitude";
    try {
      final response = await http.get(
        headers: {
          "Authorization": "Bearer $tokenLoginSiswa",
        },
        Uri.parse(cekJenisAbsenUrl),
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("statuscode jenisabsensiswa: ${response.statusCode}");
        print("isi response jenisabsensiswa: $data");
        AllMaterial.box.write("statusAbsen", data["data"]["absen"]);
        AllMaterial.box.write("jenisAbsen", data["data"]["jenis_absen"]);
        AllMaterial.box.write("msgAbsen", data["data"]["msg"]);
      } else {
        print("kok masuk sini bg?");
      }
    } catch (e) {
      print("error di cekJenisAbsenSiswa: $e");
    }
  }

  Future<Map<String, dynamic>> getLokasiSiswa() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return {
        "message": "Akses Lokasi tidak aktif, mohon aktifkan GPS",
        "error": true
      };
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return {
          "message": "Akses untuk mengakses Lokasi ditolak",
          "error": true
        };
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return {
        "message":
            "Akses untuk mengakses Lokasi tidak diperbolehkan, ubah akses lokasi pada setinggan hp kamu",
        "error": true
      };
    }

    Position posisiSiswa = await Geolocator.getCurrentPosition();
    cekRadiusKoordinat(posisiSiswa.latitude, posisiSiswa.longitude);
    return {
      "position": posisiSiswa,
      "message": "Berhasil mendapatkan lokasi terkini",
      "error": false
    };
  }

  // Map<String, dynamic> dataResponse =
  //                         await controller.getLokasiSiswa();
  //                     if (!dataResponse["error"]) {
  //                       Position position = dataResponse["position"];
  //                       controller.latitudeSiswa.value = position.latitude;
  //                       controller.longitudeSiswa.value = position.longitude;
  //                       print(position.latitude);
  //                       print(position.longitude);
  //                     } else {
  //                       Get.bottomSheet(
  //                         BottomSheet(
  //                           onClosing: () {},
  //                           builder: (context) {
  //                             return Container(
  //                               decoration: BoxDecoration(
  //                                 color: AllMaterial.colorWhite,
  //                                 borderRadius: BorderRadius.circular(25),
  //                               ),
  //                               width: Get.width,
  //                               height: 120,
  //                               child: Column(
  //                                 mainAxisAlignment: MainAxisAlignment.center,
  //                                 crossAxisAlignment: CrossAxisAlignment.start,
  //                                 children: [
  //                                   Text(
  //                                     "Kesalahan",
  //                                     style: TextStyle(
  //                                       fontSize: 17,
  //                                       fontWeight: AllMaterial.fontSemiBold,
  //                                     ),
  //                                   ),
  //                                   SizedBox(height: 5),
  //                                   Text("${dataResponse["message"]}!"),
  //                                 ],
  //                               ),
  //                               padding: EdgeInsets.all(20),
  //                             );
  //                           },
  //                         ),
  //                       );
  //                     }
}
