// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simon_pkl/app/modules/siswa/ajuan_pkl/views/ajuan_pkl_view.dart';
import 'package:simon_pkl/material/material.dart';
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
                SelectNavigatorDudiWigdet(
                  icon: Icon(
                    Icons.monitor,
                    size: 80,
                    color: AllMaterial.colorWhite,
                  ),
                  nama: "Monitoring Siswa",
                  onTap: () => print("Monitoring Siswa"),
                ),
                SelectNavigatorDudiWigdet(
                  icon: Icon(
                    Icons.calendar_month_outlined,
                    size: 80,
                    color: AllMaterial.colorWhite,
                  ),
                  nama: "Pengaturan Jadwal",
                  onTap: () => print("Pengaturan Jadwal"),
                ),
                SelectNavigatorDudiWigdet(
                  icon: Icon(
                    Icons.person,
                    size: 80,
                    color: AllMaterial.colorWhite,
                  ),
                  nama: "Pengajuan PKL",
                  onTap: () => Get.toNamed('/pengajuan-pkl'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SelectNavigatorDudiWigdet extends StatelessWidget {
  Icon icon;
  String nama;
  void Function()? onTap;

  SelectNavigatorDudiWigdet({
    required this.icon,
    required this.nama,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      child: InkWell(
        onTap: onTap,
        child: Ink(
          height: 100,
          width: Get.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 30,
              ),
              icon,
              SizedBox(
                width: 25,
              ),
              Text(
                nama,
                style: TextStyle(
                  fontWeight: AllMaterial.fontBold,
                  fontSize: 18,
                  color: AllMaterial.colorWhite,
                  fontFamily: AllMaterial.fontFamily,
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AllMaterial.colorBlue,
            boxShadow: [
              BoxShadow(
                color: AllMaterial.colorGreySec,
                spreadRadius: 0.2,
                blurRadius: 8,
                offset: Offset(0, 5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
