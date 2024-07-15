import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:simon_pkl/app/modules/siswa/beranda_page/controllers/beranda_page_controller.dart';
import 'package:simon_pkl/app/modules/siswa/beranda_page/views/beranda_page_view.dart';
// import 'package:simon_pkl/app/modules/siswa/beranda_page/views/beranda_page_view.dart';
import 'package:simon_pkl/app/routes/app_pages.dart';
import 'package:simon_pkl/material/allmaterial.dart';

class LoginController extends GetxController {
  var focusNode = FocusNode();
  var focusNode2 = FocusNode();

  static const loginUrl = "http://10.0.2.2:2008/auth/auth";
  static const getSiswaUrl = "http://10.0.2.2:2008/siswa/getSiswa";
  static const getGuruUrl =
      "http://10.0.2.2:2008/guruPembimbing/getGuruPembimbing";
  static const getDudiUrl =
      "http://10.0.2.2:2008/pembimbingDudi/getPembimbingDudi";

  RxBool isDudi = RxBool(false);
  RxBool isSiswa = RxBool(false);
  RxBool isGuru = RxBool(false);

  TextEditingController textBodyC = TextEditingController();
  TextEditingController pwC = TextEditingController();

  RxBool isAuth = RxBool(false);
  RxBool isObsecure = true.obs;
  String getDataUrl = "";
  static var tokenLogin = "".obs;
  var dataAuth = "";

  Future<void> login() async {
    try {
      final response = await http.post(
        Uri.parse(loginUrl),
        body: {
          "textBody": textBodyC.text,
          "password": pwC.text,
        },
      );
      var data = jsonDecode(response.body);
      if (textBodyC.text.isNotEmpty && pwC.text.isNotEmpty) {
        if (response.statusCode == 200 || response.statusCode == 201) {
          if (data["msg"].toString().contains("expired")) {
            AllMaterial.box.remove("token");
          } else {
            AllMaterial.box.write("token", data["acces_token"]);
            update();
          }
          tokenLogin.value = data["acces_token"];
          print(data);
          if (data["auth"] == "pembimbing dudi") {
            getDataUrl = getDudiUrl;
            print("sebagai dudi");
            AllMaterial.box.write("authentikasi", data["auth"]);
            dataAuth = AllMaterial.box.read("authentikasi");
            await autoLogin();
            isAuth.value = true;
            isDudi.value = true;
            print("apakah auth sebagai dudi? : $isAuth");
            return data;
          } else if (data["auth"] == "guru pembimbing") {
            print("sebagai guru");
            getDataUrl = getGuruUrl;
            isAuth.value = true;
            isGuru.value = true;
            AllMaterial.box.write("authentikasi", data["auth"]);
            dataAuth = AllMaterial.box.read("authentikasi");
            await autoLogin();

            return data;
          } else if (data["auth"] == "siswa") {
            getDataUrl = getSiswaUrl;
            isAuth.value = true;
            isSiswa.value = true;
            AllMaterial.box.remove("authentikasi");
            AllMaterial.box.write("authentikasi", data["auth"]);
            dataAuth = AllMaterial.box.read("authentikasi");
            await autoLogin();
            return data;
          }
        } else {
          print("error di response");
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
                      Text("${data["msg"]}!"),
                    ],
                  ),
                  padding: EdgeInsets.all(20),
                );
              },
            ),
          );
          update();
        }
      } else {
        print("error di empty");
        Get.bottomSheet(BottomSheet(
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
                  Text("ID/USERNAME/PASSWORD tidak boleh kosong!"),
                ],
              ),
              padding: EdgeInsets.all(20),
            );
          },
        ));
      }
    } catch (e) {
      print("error : $e");
    }
  }

  Future<void> autoLogin() async {
    try {
      cekStatusFCM();
      if (tokenLogin.value.isNotEmpty ||
          AllMaterial.box.read("token") != null) {
        if (getDataUrl.isNotEmpty) {
          final response = await http.get(
            Uri.parse(getDataUrl),
            headers: {
              "Authorization": "Bearer ${tokenLogin.value}",
            },
          );
          if (response.statusCode == 200) {
            isAuth.value = true;
            var data = jsonDecode(response.body);
            print(data);
            print(response.statusCode);
            if (data["data"].toString().contains("username")) {
              AllMaterial.box.write("dataLoginDudi", data["data"]);
              await loginPage();
              print(data["data"]);
            } else if (data["data"].toString().contains("nip")) {
              AllMaterial.box.write("dataLoginGuru", data["data"]);
              await loginPage();
              print(data["data"]);
            } else if (data["data"].toString().contains("nis")) {
              AllMaterial.box.write("dataLoginSiswa", data["data"]);
              await loginPage();
              print("data di autologin: ${data["data"]}");
            }
          } else {
            AllMaterial.box.erase();
            isAuth.value = false;
          }
        }
      }
    } catch (e) {
      print(getDataUrl);
      print("error di autoLogin : $e");
    }
  }

  loginPage() async {
    final dataLoginDudi = await AllMaterial.box.read("dataLoginDudi");
    final dataLoginGuru = await AllMaterial.box.read("dataLoginGuru");
    final dataLoginSiswa = await AllMaterial.box.read("dataLoginSiswa");
    if (dataLoginDudi != null && dataLoginDudi != "" && tokenLogin.isNotEmpty) {
      return Get.offNamed("/home-dudi");
    } else if (dataLoginSiswa != null &&
        dataLoginSiswa != "" &&
        tokenLogin.isNotEmpty) {
      await controller.findStatusSiswa();
      return Get.offNamed("/siswa");
    } else if (dataLoginGuru != null &&
        dataLoginGuru != "" &&
        tokenLogin.isNotEmpty) {
      return Get.offNamed("/home-guru");
    } else {
      return Get.offNamed("/login");
    }
  }

  void logout() async {
    await AllMaterial.box.erase();
    Get.offAllNamed(Routes.LOGIN);
    var dataLoginSiswa = AllMaterial.box.read("dataLoginSiswa");
    if (dataLoginSiswa != null) {
      BerandaPageView.indexWidget.value = "";
    }
  }

  Future<void> postTokenFCM() async {
    var _tokenFCM = AllMaterial.box.read("fcmToken");
    var _postTokenFCMUrl = "http://10.0.2.2:2008/siswa/addTokenFCM";
    var _response = await http.post(
      headers: {
        "Authorization": "Bearer ${tokenLogin.value}",
      },
      body: {"tokenFCM": _tokenFCM},
      Uri.parse(_postTokenFCMUrl),
    );
    print("statuscode di func: ${_response.statusCode}");
    if (_response.statusCode == 200) {
      print("postTokenFCM() di func dijalankan");
    }
  }

  Future<void> getTokenFCM() async {
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
    var fcmToken = await _firebaseMessaging.getToken();
    print("getTokenFCM() dijalankan");
    AllMaterial.box.write("fcmToken", fcmToken);
    if (fcmToken != null || fcmToken != "") {
      await postTokenFCM();
      print("postTokenFCM() dijalankan");
    }
  }

  Future<void> cekStatusFCM() async {
    var _cekStatusFCMUrl = "http://10.0.2.2:2008/siswa/statusTokenFCM";
    var _response = await http.get(
      headers: {
        "Authorization": "Bearer ${tokenLogin.value}",
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

  @override
  void onClose() {
    textBodyC.clear();
    pwC.clear();
    super.onClose();
  }
}




  // Future<dynamic> fetchDataSiswa() async {
  //   final response = await http.get(
  //     Uri.parse(getSiswaUrl),
  //     headers: {
  //       "Authorization": "Bearer $tokenLogin",
  //     },
  //   );
  //   var data = jsonDecode(response.body) as Map<String, dynamic>;
  //   print(response.statusCode);
  //   if (response.statusCode == 200) {
  //     print(data["data"]);
  //     AllMaterial.box.write("siswaData", data["data"]);
  //     isvalue = true;
  //   } else {
  //     throw Exception('Error min');
  //   }
  // }