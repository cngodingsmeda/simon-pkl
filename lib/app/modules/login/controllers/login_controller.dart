import 'dart:convert';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:simon_pkl/app/routes/app_pages.dart';
import 'package:simon_pkl/material/material.dart';

class LoginController extends GetxController {
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
  static String tokenLogin = AllMaterial.box.read("token");
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
          AllMaterial.box.write("token", data["acces_token"]);
          if (data["auth"] == "pembimbing dudi") {
            getDataUrl = getDudiUrl;
            print("sebagai dudi");
            AllMaterial.box.write("authentikasi", data["auth"]);
            dataAuth = AllMaterial.box.read("authentikasi");
            await autoLogin();
            isAuth.value = true;
            isDudi.value = true;
            Get.reset();
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
            print("apakah auth sebagai guru? : $isAuth");
            return data;
          } else if (data["auth"] == "siswa") {
            getDataUrl = getSiswaUrl;
            isAuth.value = true;
            isSiswa.value = true;
            AllMaterial.box.write("authentikasi", data["auth"]);
            dataAuth = AllMaterial.box.read("authentikasi");
            await autoLogin();
            print("apakah auth sebagai siswa? : $isAuth");
            return data;
          }
        } else {
          print("error di response");
          print(response.statusCode);
          await AllMaterial.alertSimon(
            msg: "Kesalahan",
            msgC: data[toBeginningOfSentenceCase("msg")],
          );
        }
      } else {
        print("error di empty");
        await AllMaterial.alertSimon(
          msg: "Kesalahan",
          msgC: "NISN/Password harus diisi",
        );
      }
    } catch (e) {
      print("error : $e");
      await AllMaterial.alertSimon(
        msg: "Kesalahan",
        msgC: "Periksa kembali Username/Password Anda",
      );
    }
  }

  Future<void> autoLogin() async {
    try {
      final tokenLogin = AllMaterial.box.read("token");
      if (tokenLogin != null) {
        if (getDataUrl.isNotEmpty) {
          final response = await http.get(
            Uri.parse(getDataUrl),
            headers: {
              "Authorization": "Bearer $tokenLogin",
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
              print(data["data"]);
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
    if (dataLoginDudi != null && dataLoginDudi != "") {
      return Get.offNamed("/home-dudi");
    } else if (dataLoginSiswa != null && dataLoginSiswa != "") {
      return Get.offNamed("/siswa");
    } else if (dataLoginGuru != null && dataLoginGuru != "") {
      return Get.offNamed("/home-guru");
    } else {
      return Get.offNamed("/login");
    }
  }

  void logout() async {
    await AllMaterial.box.erase();
    Get.offAllNamed(Routes.LOGIN);
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