import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/app/modules/login/controllers/login_controller.dart';
import 'package:simon_pkl/app/modules/siswa/ajuan_pkl/views/ajuan_pkl_view.dart';
import 'package:simon_pkl/app/modules/siswa/beranda_page/views/beranda_page_view.dart';
import 'package:simon_pkl/app/modules/siswa/lokasi_pkl/controllers/lokasi_pkl_controller.dart';
import 'package:simon_pkl/app/routes/app_pages.dart';
import 'package:http/http.dart' as http;
import 'package:string_capitalize/string_capitalize.dart';
import '../../../../../material/allmaterial.dart';

class BerandaPageController extends GetxController {
  var cancelPKLUrl = "http://10.0.2.2:2008/siswa/cancelPengajuanPkl";
  Future<void> cancelPKL() async {
    var tokenLogin = AllMaterial.box.read("token");
    int idAjuanPKL = AllMaterial.box.read("idAjuanPKL");
    try {
      var response = await http.post(
        headers: {
          "Authorization": "Bearer $tokenLogin",
        },
        body: {
          "id": "$idAjuanPKL",
        },
        Uri.parse(
          cancelPKLUrl,
        ),
      );
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        AllMaterial.box.remove("selectedData");
        BerandaPageView.ip.value = 0;
      }
    } catch (e) {
      print("error di cancel PKL: $e");
    }
  }

  Future<void> cekStatusFCM() async {
    var _tokenLogin = AllMaterial.box.read("token");
    var _cekStatusFCMUrl = "http://10.0.2.2:2008/siswa/statusTokenFCM";
    var _response = await http.get(
      headers: {
        "Authorization": "Bearer $_tokenLogin",
      },
      Uri.parse(
        _cekStatusFCMUrl,
      ),
    );
    var data = jsonDecode(_response.body);
    if (data["token_FCM"] != false) {
      await getTokenFCM();
      print("cekStatusFCM() dijalankan");
    }
  }

  Future<void> getTokenFCM() async {
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
    var fcmToken = await _firebaseMessaging.getToken();
    print("getTokenFCM() dijalankan");
    AllMaterial.box.write("fcmToken", fcmToken);
    postTokenFCM();
  }

  var _tokenFCM = AllMaterial.box.read("fcmToken");
  Future<void> postTokenFCM() async {
    var _tokenLogin = AllMaterial.box.read("token");
    var _postTokenFCMUrl = "http://10.0.2.2:2008/siswa/addTokenFCM";
    var _response = await http.post(
      headers: {
        "Authorization": "Bearer $_tokenLogin",
      },
      body: {"tokenFCM": _tokenFCM},
      Uri.parse(_postTokenFCMUrl),
    );
    if (_response.statusCode == 200) {
      print("postTokenFCM() dijalankan");
    }
  }

  @override
  void onInit() {
    Get.put(LoginController());
    if (_tokenFCM == null || _tokenFCM == "") {
      cekStatusFCM();
    }
    super.onInit();
  }

  Future<void> ambilDataDudi() async {
    var dataPKL = Get.put(LokasiPklController());
    await dataPKL.fetchData();
    Get.toNamed(Routes.LOKASI_PKL);
  }
}

var controller = Get.put(BerandaPageController());
var dataSiswa = AllMaterial.box.read("dataLoginSiswa");
var dudiTerpilih = AllMaterial.box.read("dudiTerpilih");
var dataNisSiswa = dataSiswa["nis"];

class HomePageNol extends StatelessWidget {
  const HomePageNol({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        surfaceTintColor: AllMaterial.colorWhite,
        backgroundColor: AllMaterial.colorWhite,
        leading: Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            width: 25,
            height: 25,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/logo/logo-simon-var2.png"),
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: IconButton(
              onPressed: () {
                controller.ambilDataDudi();
              },
              icon: const Icon(Icons.add_outlined),
              color: Colors.white,
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  AllMaterial.colorBlue,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Text(
          "Belum ada data nih...\nKlik + untuk memilih instansi",
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: AllMaterial.fontFamily),
        ),
      ),
    );
  }
}

class HomePageSatu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            ClipPath(
              clipper: ClipPathClass(),
              child: Container(
                height: 300,
                width: Get.width,
                color: AllMaterial.colorBlue,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Selamat Datang, Siswa",
                              style: TextStyle(
                                fontFamily: AllMaterial.fontFamily,
                                fontSize: 18,
                                color: AllMaterial.colorWhite,
                                fontWeight: AllMaterial.fontBold,
                              ),
                            ),
                            Text(
                              "NISN : ${dataNisSiswa}",
                              style: TextStyle(
                                fontFamily: AllMaterial.fontFamily,
                                fontSize: 15,
                                color: AllMaterial.colorWhite,
                                fontWeight: AllMaterial.fontRegular,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            Get.toNamed(Routes.AJUAN_PKL);
                          },
                          icon: const Icon(Icons.history),
                          color: AllMaterial.colorBlue,
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              AllMaterial.colorWhite,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 130),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: Get.width,
                      margin: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AllMaterial.colorWhite,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(34, 63, 63, 63),
                            offset: Offset(5, 5),
                            blurRadius: 25,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(
                              width: Get.width,
                              margin: EdgeInsets.all(10),
                              child: Text(
                                "Ajuan Saya :",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: AllMaterial.fontFamily,
                                  fontWeight: AllMaterial.fontSemiBold,
                                  color: AllMaterial.colorBlack,
                                ),
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  ListTile(
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 0,
                                      horizontal: 15,
                                    ),
                                    title: Text(
                                      "Instansi Dipilih :",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: AllMaterial.fontFamily,
                                      ),
                                    ),
                                    subtitle: Text(
                                      "${dudiTerpilih["nama_instansi_perusahaan"]}"
                                          .capitalizeEach(),
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: AllMaterial.fontFamily,
                                        fontWeight: AllMaterial.fontBold,
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 0,
                                      horizontal: 15,
                                    ),
                                    title: Text(
                                      "No. Telpon Instansi :",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: AllMaterial.fontFamily,
                                      ),
                                    ),
                                    subtitle: Text(
                                      "${dudiTerpilih["no_telepon"]}",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: AllMaterial.fontFamily,
                                        fontWeight: AllMaterial.fontBold,
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 0,
                                      horizontal: 15,
                                    ),
                                    title: Text(
                                      "Alamat Instansi :",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: AllMaterial.fontFamily,
                                      ),
                                    ),
                                    subtitle: Text(
                                      "${dudiTerpilih["detail_tempat"]}, ${dudiTerpilih["desa"]}, ${dudiTerpilih["kecamatan"]}, ${dudiTerpilih["kabupaten"]}, ${dudiTerpilih["provinsi"]}"
                                          .capitalizeEach(),
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: AllMaterial.fontFamily,
                                        fontWeight: AllMaterial.fontBold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size.fromWidth(150),
                                    surfaceTintColor: AllMaterial.colorWhite,
                                    backgroundColor: AllMaterial.colorWhite,
                                    foregroundColor: AllMaterial.colorWhite,
                                    shadowColor: AllMaterial.colorWhite,
                                    elevation: 0,
                                    side: BorderSide(
                                      color: AllMaterial.colorRed,
                                      width: 1,
                                    ),
                                  ),
                                  onPressed: () {
                                    Get.defaultDialog(
                                      middleTextStyle: TextStyle(
                                        fontFamily: AllMaterial.fontFamily,
                                      ),
                                      backgroundColor: AllMaterial.colorWhite,
                                      radius: 10,
                                      buttonColor: AllMaterial.colorBlue,
                                      titleStyle: TextStyle(
                                          fontWeight: AllMaterial.fontMedium),
                                      title: "Konfirmasi",
                                      middleText:
                                          "Apakah Anda yakin ingin membatalkan PKL di ${dudiTerpilih["nama_instansi_perusahaan"].toString().capitalizeEach()}?",
                                      onConfirm: () {
                                        Get.back();
                                        controller.cancelPKL();
                                      },
                                      barrierDismissible: true,
                                      textCancel: "Batalkan",
                                      textConfirm: "Konfirmasi",
                                    );
                                  },
                                  child: Text(
                                    "Batalkan",
                                    style: TextStyle(
                                      fontFamily: AllMaterial.fontFamily,
                                      color: AllMaterial.colorRed,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size.fromWidth(150),
                                    surfaceTintColor: AllMaterial.colorWhite,
                                    backgroundColor: AllMaterial.colorWhite,
                                    foregroundColor: AllMaterial.colorWhite,
                                    shadowColor: AllMaterial.colorWhite,
                                    elevation: 0,
                                    side: BorderSide(
                                      color: AllMaterial.colorGreen,
                                      width: 1,
                                    ),
                                  ),
                                  onPressed: () {
                                    Get.toNamed(Routes.AJUAN_PKL);
                                  },
                                  child: Text(
                                    "Cek Status",
                                    style: TextStyle(
                                      fontFamily: AllMaterial.fontFamily,
                                      color: AllMaterial.colorGreen,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePageDua extends StatelessWidget {
  const HomePageDua({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
