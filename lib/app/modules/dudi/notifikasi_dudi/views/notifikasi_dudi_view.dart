// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/material/material.dart';
import 'package:simon_pkl/app/modules/siswa/ajuan_pkl/views/ajuan_pkl_view.dart';
import 'package:simon_pkl/app/modules/dudi/notifikasi_dudi/notifikasi_dudi_widget.dart';
import '../controllers/notifikasi_dudi_controller.dart';

class NotifikasiDudiView extends GetView<NotifikasiDudiController> {
  final int notif = 0;

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
                      children: [],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: context.mediaQueryPadding.top + 20),
                  child: Text(
                    "Notifikasi",
                    style: TextStyle(
                      fontFamily: AllMaterial.fontFamily,
                      color: AllMaterial.colorWhite,
                      fontWeight: AllMaterial.fontSemiBold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(
                    vertical: 30,
                  ),
                  child: Icon(
                    Icons.notifications,
                    size: 210,
                    color: AllMaterial.colorWhite.withOpacity(.5),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 230, horizontal: 40),
              child: Row(
                children: [
                  Icon(
                    Icons.access_time_sharp,
                    color: AllMaterial.colorWhite,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Pesan akan terhapus dalam 24 Jam terakhir",
                    style: TextStyle(
                      fontFamily: AllMaterial.fontFamily,
                      fontSize: 11,
                      color: AllMaterial.colorWhite,
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: Get.height * 0.33,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Container(
                    height: 55,
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AllMaterial.colorWhite,
                      boxShadow: [
                        BoxShadow(
                          color: AllMaterial.colorGrey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            "Notifikasi : ",
                            style: TextStyle(
                              fontFamily: AllMaterial.fontFamily,
                              fontWeight: AllMaterial.fontBold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 80,
                          decoration: BoxDecoration(
                            color: AllMaterial.colorGrey.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            '$notif',
                            style: TextStyle(
                              fontWeight: AllMaterial.fontBold,
                              fontFamily: AllMaterial.fontFamily,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        // SizedBox(width: 10),
                      ],
                    ),
                  ),
                ),
                // SizedBox(height: 20),
                notif == 0
                    ? Center(
                        heightFactor: 13,
                        child: Text(
                          "Belum ada pesan",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: AllMaterial.fontFamily,
                            fontSize: 20,
                            color: AllMaterial.colorGrey.withOpacity(.4),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10, left: 10, right: 10),
                        child: SizedBox(
                          height: Get.height,
                          child: ListView.builder(
                            itemCount: notif,
                            itemBuilder: (context, index) => NotifikasiItemDudi(
                              contextTitle: "Kabar baik untukmu!",
                              subTitle:
                                  "Ajuan PKL-mu diterima di PT. Telkom Indonesia",
                              contextImage: "assets/logo/accept.png",
                              onTapFunc: () {
                                // Get.toNamed(RoutesName.settingsPage);
                              },
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
