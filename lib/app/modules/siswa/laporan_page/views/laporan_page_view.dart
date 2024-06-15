import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simon_pkl/app/modules/siswa/beranda_page/controllers/beranda_page_controller.dart';
import 'package:simon_pkl/app/modules/siswa/beranda_page/views/beranda_page_view.dart';
import 'package:simon_pkl/app/routes/app_pages.dart';
import 'package:simon_pkl/material/allmaterial.dart';

import '../controllers/laporan_page_controller.dart';

class LaporanPageView extends GetView<LaporanPageController> {
  var controllerB = Get.put(BerandaPageController());
  LaporanPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (BerandaPageView.indexWidget.value == "pkl")
          ? AppBar(
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
                     Get.defaultDialog(
                      backgroundColor: AllMaterial.colorWhite,
                      title: "Laporan Tanggal",
                      
                      titleStyle: TextStyle(
                        fontSize: 12,
                        color: AllMaterial.colorBlack,
                      ),
                      custom: Container(
                        
                        child: Column(),
                      ),
                     );
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
            )
          : AppBar(
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
      body: buildBody(),
    );
  }

  Widget buildBody() {
    if (BerandaPageView.indexWidget.value == "belum_pkl") {
      return Center(
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
              style: TextStyle(
                fontFamily: AllMaterial.fontFamily,
                fontSize: 11,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                controllerB.ambilDataDudi();
              },
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(AllMaterial.colorBlue),
              ),
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
      );
    } else if (BerandaPageView.indexWidget.value == "proses" || BerandaPageView.indexWidget.value == "pending") {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Belum ada Laporan",
              style:
                  TextStyle(fontFamily: AllMaterial.fontFamily, fontSize: 16,),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Kamu bakal dapet laporan kalo ajuan PKL-mu diterima",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AllMaterial.fontFamily,
                fontSize: 11,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.AJUAN_PKL);
              },
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(AllMaterial.colorBlue),
              ),
              child: const Text(
                "Cek Status Ajuan PKL Saya",
                style: TextStyle(
                  fontFamily: AllMaterial.fontFamily,
                  fontSize: 12,
                  color: AllMaterial.colorWhite,
                ),
              ),
            ),
          ],
        ),
      );
    } else if (BerandaPageView.indexWidget.value == "pkl") {
      return Scaffold(
        backgroundColor: AllMaterial.colorWhite,
        body: Center(
          child: Text(
            "Belum ada data nih...\nKlik + untuk menambah Laporan Harian",
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: AllMaterial.fontFamily),
          ),
        ),
      );
    } else {
      return Scaffold();
    }
  }
}
