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
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        surfaceTintColor: AllMaterial.colorWhite,
        backgroundColor: AllMaterial.colorWhite,
        title: const Text('Menu Absen'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SelectNavigatorSiswa(
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
            active: false,
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
            "*Jika tombol tidak aktif, maka proses telah tuntas",
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

