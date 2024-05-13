import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simon_pkl/app/routes/app_pages.dart';
import 'package:simon_pkl/material/material.dart';

import '../controllers/laporan_page_controller.dart';

class LaporanPageView extends GetView<LaporanPageController> {
  const LaporanPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      backgroundColor: AllMaterial.colorWhite,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Belum ada Laporan",
              style:
                  TextStyle(fontFamily: AllMaterial.fontFamily, fontSize: 16),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Kamu bakal dapet laporan kalo udah memilih Dudi",
              textAlign: TextAlign.center,
              style:
                  TextStyle(fontFamily: AllMaterial.fontFamily, fontSize: 11),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () => Get.toNamed(Routes.LOKASI_PKL),
              style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(AllMaterial.colorBlue)),
              child: const Text(
                "Mulai Temukan Dudi",
                style: TextStyle(
                    fontFamily: AllMaterial.fontFamily,
                    fontSize: 12,
                    color: AllMaterial.colorWhite),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
