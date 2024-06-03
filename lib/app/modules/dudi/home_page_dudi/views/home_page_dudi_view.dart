// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simon_pkl/app/modules/dudi/home_page_dudi/select_navigator_dudi_widget.dart';
import 'package:simon_pkl/app/modules/dudi/monitoring_siswa_dudi/views/monitoring_siswa_dudi_view.dart';
import 'package:simon_pkl/app/modules/dudi/pengajuan_pkl/views/pengajuan_pkl_view.dart';
import 'package:simon_pkl/app/modules/dudi/pengaturan_jadwal_dudi/views/pengaturan_jadwal_dudi_view.dart';
import 'package:simon_pkl/app/modules/siswa/ajuan_pkl/views/ajuan_pkl_view.dart';
import 'package:simon_pkl/material/allmaterial.dart';
import 'package:string_capitalize/string_capitalize.dart';

import '../controllers/home_page_dudi_controller.dart';

class HomePageDudiView extends GetView<HomePageDudiController> {
  var dataDudi = AllMaterial.box.read("dataLoginDudi");
  HomePageDudiView({Key? key}) : super(key: key);
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
                // width: Get.width,
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
                              "Selamat Datang, Dudi",
                              style: TextStyle(
                                fontFamily: AllMaterial.fontFamily,
                                fontSize: 18,
                                color: AllMaterial.colorWhite,
                                fontWeight: AllMaterial.fontBold,
                              ),
                            ),
                            Text(
                              "Instansi : ${dataDudi["dudi"]["nama_instansi_perusahaan"]}"
                                  .capitalizeEach(),
                              style: TextStyle(
                                fontFamily: AllMaterial.fontFamily,
                                fontSize: 15,
                                color: AllMaterial.colorWhite,
                                fontWeight: AllMaterial.fontRegular,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 90,
              ),
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    opacity: .5,
                    image: AssetImage(
                      "assets/logo/computer.png",
                    ),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: Get.height * 0.33,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 27),
                  child: Container(
                    height: 55,
                    width: Get.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Siswa Yang Dibimbing : ",
                          style: TextStyle(
                            fontFamily: AllMaterial.fontFamily,
                            fontWeight: AllMaterial.fontBold,
                            fontSize: 15,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 70,
                          child: Text(
                            '0',
                            style: TextStyle(
                              fontWeight: AllMaterial.fontBold,
                              fontFamily: AllMaterial.fontFamily,
                              fontSize: 18,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: AllMaterial.colorGrey.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
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
                  ),
                ),
                SelectNavigatorDudiWidget(
                  icon: Icon(
                    Icons.monitor,
                    size: 80,
                    color: AllMaterial.colorWhite,
                  ),
                  nama: "Monitoring Siswa",
                  onTap: () => Get.to(() => MonitoringSiswaDudiView()),
                ),
                SelectNavigatorDudiWidget(
                  icon: Icon(
                    Icons.calendar_month_outlined,
                    size: 80,
                    color: AllMaterial.colorWhite,
                  ),
                  nama: "Pengaturan Jadwal",
                  onTap: () => Get.to(() => PengaturanJadwalDudiView()),
                ),
                SelectNavigatorDudiWidget(
                  icon: Icon(
                    Icons.person,
                    size: 80,
                    color: AllMaterial.colorWhite,
                  ),
                  nama: "Pengajuan PKL",
                  onTap: () => Get.to(() => PengajuanPklView()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
