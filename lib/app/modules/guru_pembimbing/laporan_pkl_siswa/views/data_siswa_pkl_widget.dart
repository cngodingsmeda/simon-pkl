import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:simon_pkl/material/material.dart';

class DataSiswaPklWidget extends StatelessWidget {
  String namaSiswa;
  int nisn;
  String agama;
  String jenisKelamin;
  String jurusan;
  int noTelepon;
  String kelas;
  String instansiSiswa;

  DataSiswaPklWidget({
    required this.namaSiswa,
    required this.nisn,
    required this.agama,
    required this.jenisKelamin,
    required this.jurusan,
    required this.noTelepon,
    required this.kelas,
    required this.instansiSiswa,
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
              child: Row(
                children: [
                  Text(
                    '$namaSiswa',
                    style: TextStyle(
                      fontFamily: AllMaterial.fontFamily,
                      color: AllMaterial.colorWhite,
                      fontWeight: AllMaterial.fontSemiBold,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    '• $kelas',
                    style: TextStyle(
                      fontFamily: AllMaterial.fontFamily,
                      color: AllMaterial.colorWhite,
                      fontWeight: AllMaterial.fontSemiBold,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),
            backgroundColor: AllMaterial.colorBlue,
            collapsedBackgroundColor: AllMaterial.colorBlue,
            trailing: PopupMenuButton(
              color: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
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
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        color: Colors.red,
                      ),
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
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        color: AllMaterial.colorWhite,
                      ),
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
                width: Get.width,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      dataSiswaGuru(
                        title: "Nama",
                        subTitle: namaSiswa,
                      ),
                      dataSiswaGuru(title: "NISN", subTitle: "$nisn"),
                      dataSiswaGuru(title: "Agama", subTitle: agama),
                      dataSiswaGuru(
                          title: "Jenis Kelamin", subTitle: jenisKelamin),
                      dataSiswaGuru(title: "Jurusan", subTitle: "$jurusan"),
                      dataSiswaGuru(
                          title: "Instansi", subTitle: "$instansiSiswa"),
                      dataSiswaGuru(
                          title: "No. Telpon", subTitle: "$noTelepon"),
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

class dataSiswaGuru extends StatelessWidget {
  const dataSiswaGuru({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$title :',
          style: TextStyle(
            fontFamily: AllMaterial.fontFamily,
            fontSize: 17,
            fontWeight: AllMaterial.fontSemiBold,
          ),
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            ' $subTitle',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: AllMaterial.fontFamily,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
