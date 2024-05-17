import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:simon_pkl/material/material.dart';

// ignore: must_be_immutable
class DataSiswaWidget extends StatelessWidget {
  String namaSiswa;
  int nisn;
  String agama;
  String jenisKelamin;
  String jurusan;
  int noTelepon;

  DataSiswaWidget({
    required this.namaSiswa,
    required this.nisn,
    required this.agama,
    required this.jenisKelamin,
    required this.jurusan,
    required this.noTelepon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: ExpansionTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            collapsedShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                'Siswa',
                style: TextStyle(
                  fontFamily: AllMaterial.fontFamily,
                  color: AllMaterial.colorWhite,
                  fontWeight: AllMaterial.fontSemiBold,
                  fontSize: 17,
                ),
              ),
            ),
            backgroundColor: AllMaterial.colorBlue,
            collapsedBackgroundColor: AllMaterial.colorBlue,
            trailing: PopupMenuButton(
              color: AllMaterial.colorWhite,
              surfaceTintColor: AllMaterial.colorWhite,
              iconColor: AllMaterial.colorWhite,
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
                      color: Colors.red,
                      child: Text(
                        "Laporkan Siswa",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AllMaterial.colorGreySec,
                          fontFamily: AllMaterial.fontFamily,
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
                      color: AllMaterial.colorGreySec,
                      child: Text(
                        "Pindahkan Siswa",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.red,
                          fontFamily: AllMaterial.fontFamily,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ];
              },
            ),
            children: [
              Container(
                height: 200,
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Nama : $namaSiswa',
                        style: TextStyle(
                          fontFamily: AllMaterial.fontFamily,
                          fontSize: 17,
                          fontWeight: AllMaterial.fontSemiBold,
                        ),
                      ),
                      Text(
                        'NISN : $nisn',
                        style: TextStyle(
                          fontFamily: AllMaterial.fontFamily,
                          fontSize: 17,
                          fontWeight: AllMaterial.fontSemiBold,
                        ),
                      ),
                      Text(
                        'Agama : $agama',
                        style: TextStyle(
                          fontFamily: AllMaterial.fontFamily,
                          fontSize: 17,
                          fontWeight: AllMaterial.fontSemiBold,
                        ),
                      ),
                      Text(
                        'Jenis Kelamin : $jenisKelamin',
                        style: TextStyle(
                          fontFamily: AllMaterial.fontFamily,
                          fontSize: 17,
                          fontWeight: AllMaterial.fontSemiBold,
                        ),
                      ),
                      Text(
                        'Jurusan : $jurusan',
                        style: TextStyle(
                          fontFamily: AllMaterial.fontFamily,
                          fontSize: 17,
                          fontWeight: AllMaterial.fontSemiBold,
                        ),
                      ),
                      Text(
                        'No. Telepon : $noTelepon',
                        style: TextStyle(
                          fontFamily: AllMaterial.fontFamily,
                          fontSize: 17,
                          fontWeight: AllMaterial.fontSemiBold,
                        ),
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: AllMaterial.colorGreySec,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
