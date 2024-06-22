import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

abstract class AllMaterial {
  // SelectLogin
  static String pilihanLogin = "";

  // Get Storage
  static final box = GetStorage();

  // Font Family
  static const textUp = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w500,
    fontFamily: "Montserrat",
  );

  // Font Weight
  static const fontFamily = "Montserrat";
  static const fontBold = FontWeight.w700;
  static const fontSemiBold = FontWeight.w600;
  static const fontMedium = FontWeight.w500;
  static const fontRegular = FontWeight.w400;

  // Color
  static const colorBlue = Color(0xff38A3FF);
  // static const colorBlue = Colors.greenAccent;
  static const colorGrey = Color(0xff676D75);
  static const colorWhite = Colors.white;
  static const colorGreySec = Color(0xffF7F7F7);
  static const colorBlack = Color(0xff1B1D2A);
  static const colorGreen = Color(0xff15DF1D);
  static const colorRed = Color(0xffE31D1D);

  // Dialog
  static dialogSimon({
    required String msg,
    required String msgC,
    void Function()? onCancel,
    void Function()? onConfirm,
  }) {
    return Get.defaultDialog(
      backgroundColor: AllMaterial.colorWhite,
      buttonColor: AllMaterial.colorBlue,
      contentPadding: const EdgeInsets.all(5),
      title: msg,
      titleStyle: const TextStyle(
        fontSize: 18,
        fontWeight: AllMaterial.fontSemiBold,
        fontFamily: AllMaterial.fontFamily,
      ),
      content: Text(
        textAlign: TextAlign.center,
        msgC,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: AllMaterial.fontMedium,
          fontFamily: AllMaterial.fontFamily,
        ),
      ),
      textConfirm: "Konfirmasi",
      textCancel: "Batalkan",
      onCancel: onCancel,
      onConfirm: onConfirm,
    );
  }

  static waitPage() {
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      body: Center(
        child: FutureBuilder(
          future: Future.delayed(
            Duration(seconds: 10),
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/logo/pending.png"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Kesalahan...",
                      style: TextStyle(
                        fontFamily: AllMaterial.fontFamily,
                        fontSize: 25,
                        fontWeight: AllMaterial.fontBold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Silahkan periksa koneksi internet & mulai ulang aplikasi",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: AllMaterial.fontFamily,
                        fontSize: 18,
                        color: AllMaterial.colorGrey,
                        fontWeight: AllMaterial.fontMedium,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: AllMaterial.colorBlue),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Harap Tunggu Sebentar...",
                    style: TextStyle(
                      fontFamily: AllMaterial.fontFamily,
                      fontSize: 18,
                      fontWeight: AllMaterial.fontMedium,
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
