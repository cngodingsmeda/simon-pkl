// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/app/modules/siswa/ajuan_pkl/views/ajuan_pkl_view.dart';
import 'package:simon_pkl/app/routes/app_pages.dart';
import 'package:simon_pkl/material/material.dart';

import '../controllers/beranda_page_controller.dart';

class BerandaPageView extends GetView<BerandaPageController> {
  BerandaPageView({Key? key}) : super(key: key);
  var controller = Get.put(BerandaPageController());
  var dataSiswa = AllMaterial.box.read("dataLoginSiswa");
  @override
  Widget build(BuildContext context) {
    return buildBody();
  }

  Widget buildBody() {
    var dudiTerpilih = AllMaterial.box.read("dudiTerpilih");
    print(dudiTerpilih);
    var dataNisSiswa = dataSiswa["nis"];
    // var pageIndex = 0;
    var pageIndex = AllMaterial.box.read("pageIndex") ?? 0;
    print(pageIndex);
    switch (pageIndex) {
      case 0:
        return Scaffold(
          backgroundColor: AllMaterial.colorWhite,
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
            actions: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: IconButton(
                  onPressed: () {
                    controller.ambilDataDudi();
                  },
                  icon: const Icon(Icons.add_outlined),
                  color: Colors.white,
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      AllMaterial.colorBlue,
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: Center(
            child: Text(
              "Belum ada data nih...\nKlik + untuk memilih instansi",
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: AllMaterial.fontFamily),
            ),
          ),
        );
      case 1:
        // Tampilkan tampilan untuk nilai variabel 1
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
                                  "Selamat Datang, Siswa",
                                  style: TextStyle(
                                    fontFamily: AllMaterial.fontFamily,
                                    fontSize: 18,
                                    color: AllMaterial.colorWhite,
                                    fontWeight: AllMaterial.fontBold,
                                  ),
                                ),
                                Text(
                                  "NISN : ${dataNisSiswa}",
                                  style: TextStyle(
                                    fontFamily: AllMaterial.fontFamily,
                                    fontSize: 15,
                                    color: AllMaterial.colorWhite,
                                    fontWeight: AllMaterial.fontRegular,
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {
                                Get.toNamed(Routes.AJUAN_PKL);
                              },
                              icon: const Icon(Icons.history),
                              color: AllMaterial.colorBlue,
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                  AllMaterial.colorWhite,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 130),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: Get.width,
                          margin: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AllMaterial.colorWhite,
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(34, 63, 63, 63),
                                offset: Offset(5, 5),
                                blurRadius: 25,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Container(
                                  width: Get.width,
                                  margin: EdgeInsets.all(10),
                                  child: Text(
                                    "Ajuan Saya :",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: AllMaterial.fontFamily,
                                      fontWeight: AllMaterial.fontSemiBold,
                                      color: AllMaterial.colorBlack,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      ListTile(
                                        contentPadding: EdgeInsets.symmetric(
                                          vertical: 0,
                                          horizontal: 15,
                                        ),
                                        title: Text(
                                          "Instansi Dipilih :",
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: AllMaterial.fontFamily,
                                          ),
                                        ),
                                        subtitle: Text(
                                          "${dudiTerpilih["nama_instansi_perusahaan"]}",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: AllMaterial.fontFamily,
                                            fontWeight: AllMaterial.fontBold,
                                          ),
                                        ),
                                      ),
                                      ListTile(
                                        contentPadding: EdgeInsets.symmetric(
                                          vertical: 0,
                                          horizontal: 15,
                                        ),
                                        title: Text(
                                          "No. Telpon :",
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: AllMaterial.fontFamily,
                                          ),
                                        ),
                                        subtitle: Text(
                                          "${dudiTerpilih["no_telepon"]}",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: AllMaterial.fontFamily,
                                            fontWeight: AllMaterial.fontBold,
                                          ),
                                        ),
                                      ),
                                      ListTile(
                                        contentPadding: EdgeInsets.symmetric(
                                          vertical: 0,
                                          horizontal: 15,
                                        ),
                                        title: Text(
                                          "Alamat Instansi :",
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: AllMaterial.fontFamily,
                                          ),
                                        ),
                                        subtitle: Text(
                                          "${dudiTerpilih["detail_tempat"]}, ${dudiTerpilih["desa"]}, ${dudiTerpilih["kecamatan"]}, ${dudiTerpilih["kabupaten"]}, ${dudiTerpilih["provinsi"]}",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: AllMaterial.fontFamily,
                                            fontWeight: AllMaterial.fontBold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        fixedSize: Size.fromWidth(150),
                                        surfaceTintColor:
                                            AllMaterial.colorWhite,
                                        backgroundColor: AllMaterial.colorWhite,
                                        foregroundColor: AllMaterial.colorWhite,
                                        shadowColor: AllMaterial.colorWhite,
                                        elevation: 0,
                                        side: BorderSide(
                                          color: AllMaterial.colorRed,
                                          width: 1,
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        "Batalkan",
                                        style: TextStyle(
                                          fontFamily: AllMaterial.fontFamily,
                                          color: AllMaterial.colorRed,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        fixedSize: Size.fromWidth(150),
                                        surfaceTintColor:
                                            AllMaterial.colorWhite,
                                        backgroundColor: AllMaterial.colorWhite,
                                        foregroundColor: AllMaterial.colorWhite,
                                        shadowColor: AllMaterial.colorWhite,
                                        elevation: 0,
                                        side: BorderSide(
                                          color: AllMaterial.colorGreen,
                                          width: 1,
                                        ),
                                      ),
                                      onPressed: () {
                                        Get.toNamed(Routes.AJUAN_PKL);
                                      },
                                      child: Text(
                                        "Cek Status",
                                        style: TextStyle(
                                          fontFamily: AllMaterial.fontFamily,
                                          color: AllMaterial.colorGreen,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      case 2:
        // Tampilkan tampilan untuk nilai variabel 2
        return Center(
          child: Text(
            "Halaman 2",
            style: TextStyle(fontFamily: AllMaterial.fontFamily),
          ),
        );
      case 3:
        // Tampilkan tampilan untuk nilai variabel 3
        return Center(
          child: Text(
            "Halaman 3",
            style: TextStyle(fontFamily: AllMaterial.fontFamily),
          ),
        );
      default:
        return SizedBox.shrink();
    }
  }
}
