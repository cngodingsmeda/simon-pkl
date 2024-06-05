import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:simon_pkl/material/allmaterial.dart';

class PengaturanJadwalDudiWidget extends StatelessWidget {
  PengaturanJadwalDudiWidget({
    required this.jamMasuk,
    required this.jamPulang,
  });

  final dynamic jamMasuk;
  final dynamic jamPulang;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      child: Container(
        width: 100,
        height: 110,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Absen Masuk  :  ',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: AllMaterial.fontBold,
                              fontFamily: AllMaterial.fontFamily,
                            ),
                          ),
                          Container(
                            width: Get.width * .18,
                            height: 23,
                            child: Center(
                              child: Text(
                                '$jamMasuk',
                                style: TextStyle(
                                  color: AllMaterial.colorBlue,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: AllMaterial.colorWhite,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: AllMaterial.colorBlue,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            'Absen Pulang :  ',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: AllMaterial.fontBold,
                              fontFamily: AllMaterial.fontFamily,
                            ),
                          ),
                          Container(
                            width: Get.width * .18,
                            height: 23,
                            child: Center(
                              child: Text(
                                '$jamPulang',
                                style: TextStyle(
                                  color: AllMaterial.colorBlue,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: AllMaterial.colorWhite,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: AllMaterial.colorBlue),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: Get.width * .23,
                ),
                PopupMenuButton(
                  color: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  surfaceTintColor: AllMaterial.colorWhite,
                  iconColor: AllMaterial.colorGrey,
                  icon: Icon(
                    MdiIcons.dotsVertical,
                  ),
                  itemBuilder: (context) {
                    return [
                      // Popup Menu Laporkan Siswa
                      PopupMenuItem(
                        onTap: () => AllMaterial.dialogSimon(
                          msg: "Apakah Anda ingin Logout?",
                          msgC:
                              "Jika Anda logout, semua laporan anda saat ini tidak dapat diakses kecuali anda login kembali.",
                          onCancel: () => print("Batal Laporkan Siswa"),
                          onConfirm: () {},
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          width: Get.width * 0.5,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            color: Colors.grey[300],
                            border: Border.all(
                                color: AllMaterial.colorGrey, width: 2),
                          ),
                          child: Text(
                            "Lokasi",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AllMaterial.colorBlack,
                              fontFamily: AllMaterial.fontFamily,
                              fontWeight: AllMaterial.fontBold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),

                      // Popup Menu Pindahkan Siswa
                      PopupMenuItem(
                        onTap: () => AllMaterial.dialogSimon(
                          msg: "Apakah Anda ingin Logout?",
                          msgC:
                              "Jika Anda logout, semua laporan anda saat ini tidak dapat diakses kecuali anda login kembali.",
                          onCancel: () => print("Batal Pindahkan Siswa"),
                          onConfirm: () {},
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          width: Get.width * 0.5,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.symmetric(
                              vertical: BorderSide(
                                  color: AllMaterial.colorGrey, width: 2),
                            ),
                            color: Colors.grey[300],
                          ),
                          child: Text(
                            "Hapus",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AllMaterial.colorBlack,
                              fontFamily: AllMaterial.fontFamily,
                              fontWeight: AllMaterial.fontBold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () => AllMaterial.dialogSimon(
                          msg: "Apakah Anda ingin Logout?",
                          msgC:
                              "Jika Anda logout, semua laporan anda saat ini tidak dapat diakses kecuali anda login kembali.",
                          onCancel: () => print("Batal Pindahkan Siswa"),
                          onConfirm: () {},
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          width: Get.width * 0.5,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            border: Border.all(
                                color: AllMaterial.colorGrey, width: 2),
                            color: Colors.grey[300],
                          ),
                          child: Text(
                            "Edit",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AllMaterial.colorBlack,
                              fontFamily: AllMaterial.fontFamily,
                              fontWeight: AllMaterial.fontBold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ];
                  },
                ),
              ],
            ),

            // Horizontal Divider
            Container(
              width: Get.width,
              height: 1,
              color: Colors.black,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 9,
              ),
              child: Container(
                height: 20,
                width: Get.width * .5,
                child: Center(
                  child: Text(
                    '4 / 4 / 2024 - 11 / 4 / 2024',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: AllMaterial.fontFamily,
                      color: AllMaterial.colorWhite,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: AllMaterial.colorBlue,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
