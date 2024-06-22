import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simon_pkl/app/modules/siswa/absen_keluar/views/absen_keluar_view.dart';
import 'package:simon_pkl/app/modules/siswa/absen_masuk/views/absen_masuk_view.dart';
import 'package:simon_pkl/app/modules/siswa/beranda_page/controllers/beranda_page_controller.dart';
import 'package:simon_pkl/app/modules/siswa/histori_absen/views/histori_absen_view.dart';
import 'package:simon_pkl/material/allmaterial.dart';

import '../controllers/menu_absen_controller.dart';

class MenuAbsenView extends GetView<MenuAbsenController> {
  const MenuAbsenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(MenuAbsenController());
    controller.cekJenisAbsenMasuk();
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        surfaceTintColor: AllMaterial.colorWhite,
        backgroundColor: AllMaterial.colorWhite,
        title: const Text(
          'Menu Absen',
          style: TextStyle(
            color: AllMaterial.colorBlack,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SelectNavigatorSiswa(
            active: controller.isAbsenMasuk.value,
            icon: Icon(
              Icons.install_desktop_outlined,
              size: 80,
              color: AllMaterial.colorWhite,
            ),
            nama: "Absen Masuk",
            onTap: () {
              Get.to(() => AbsenMasukView());
            },
          ),
          SelectNavigatorSiswa(
            active: controller.isAbsenKeluar.value,
            icon: Icon(
              Icons.output_rounded,
              size: 80,
              color: AllMaterial.colorWhite,
            ),
            nama: "Absen Keluar",
            onTap: () {
              Get.to(() => AbsenKeluarView());
            },
          ),
          SelectNavigatorSiswa(
            active: controller.isAbsenTelat.value,
            icon: Icon(
              Icons.assignment_late_outlined,
              size: 80,
              color: AllMaterial.colorWhite,
            ),
            nama: "Absen Telat",
            onTap: () {
              Get.to(() => HistoriAbsenView());
            },
          ),
          SelectNavigatorSiswa(
            active: controller.isAbsenDiLuarRadius.value,
            icon: Icon(
              Icons.location_disabled_outlined,
              size: 80,
              color: AllMaterial.colorWhite,
            ),
            nama: "Absen Di Luar Radius",
            onTap: () {
              Get.to(() => HistoriAbsenView());
            },
          ),
          SelectNavigatorSiswa(
            icon: Icon(
              Icons.history,
              size: 80,
              color: AllMaterial.colorWhite,
            ),
            nama: "Histori Absen",
            onTap: () {
              Get.to(() => HistoriAbsenView());
            },
          ),
          SizedBox(height: 25),
          Text(
            "*Tombol yang aktif berdasarkan status absen-mu",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: AllMaterial.colorGrey,
            ),
          )
        ],
      ),
    );
  }
}
