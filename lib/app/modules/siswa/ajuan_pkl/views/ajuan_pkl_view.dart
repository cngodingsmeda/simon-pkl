// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:simon_pkl/app/modules/siswa/beranda_page/controllers/beranda_page_controller.dart';
import 'package:simon_pkl/app/routes/app_pages.dart';
import 'package:simon_pkl/material/allmaterial.dart';
import 'package:string_capitalize/string_capitalize.dart';

import '../controllers/ajuan_pkl_controller.dart';

class AjuanPklView extends GetView<AjuanPklController> {
  final dataDudiIndex = AllMaterial.box.read("selectedData");
  AjuanPklView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(dataDudiIndex);
    var controllerSiswa = Get.put(BerandaPageController());
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      MdiIcons.clockCheckOutline,
                      color: AllMaterial.colorWhite,
                      size: 80,
                    ),
                    Text(
                      "Ajuan Diproses",
                      style: TextStyle(
                        color: AllMaterial.colorWhite,
                        fontFamily: AllMaterial.fontFamily,
                        fontSize: 25,
                        fontWeight: AllMaterial.fontSemiBold,
                      ),
                    ),
                    Text(
                      "Harap verifikasi data Anda!",
                      style: TextStyle(
                        color: AllMaterial.colorWhite,
                        fontFamily: AllMaterial.fontFamily,
                        fontSize: 15,
                        fontWeight: AllMaterial.fontRegular,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 240),
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
                      child: Column(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 15,
                            ),
                            title: Text(
                              "Status Info :",
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: AllMaterial.fontFamily,
                              ),
                            ),
                            subtitle: Text(
                              "Menunggu Verifikasi",
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
                              "Instansi Dipilih :",
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: AllMaterial.fontFamily,
                              ),
                            ),
                            subtitle: Text(
                              "${dataDudiIndex["nama_instansi_perusahaan"]}"
                                  .capitalizeEach(),
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
                              "Batas Verifikasi :",
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: AllMaterial.fontFamily,
                              ),
                            ),
                            subtitle: Text(
                              "Sampai ${controller.formattedDate}",
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
                              "No. Telpon Instansi :",
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: AllMaterial.fontFamily,
                              ),
                            ),
                            subtitle: Text(
                              "${dataDudiIndex["no_telepon"]}",
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
                              "${dataDudiIndex["detail_tempat"]}, ${dataDudiIndex["desa"]}, ${dataDudiIndex["kecamatan"]}, ${dataDudiIndex["kabupaten"]}, ${dataDudiIndex["provinsi"]}"
                                  .capitalizeEach(),
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: AllMaterial.fontFamily,
                                fontWeight: AllMaterial.fontBold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: (controllerSiswa.pageIndex.value == 0) ? GestureDetector(
        onTap: () {
          controllerSiswa.increaseIndex();
          Get.offAllNamed(Routes.SISWA, arguments: controllerSiswa.pageIndex.value);
          AllMaterial.box.write("dudiTerpilih", dataDudiIndex);
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: AllMaterial.colorBlue,
            borderRadius: BorderRadius.circular(5),
          ),
          width: Get.width,
          height: 50,
          child: Center(
            child: Text(
              "Kembali Ke Beranda",
              style: TextStyle(
                fontFamily: AllMaterial.fontFamily,
                fontWeight: AllMaterial.fontSemiBold,
                color: AllMaterial.colorWhite,
              ),
            ),
          ),
        ),
      ) : SizedBox.shrink(),
    );
  }
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 20);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
