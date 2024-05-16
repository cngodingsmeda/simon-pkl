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
        SizedBox(
          height: Get.height * 0.47,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ExpansionTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            collapsedShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: Text(
              'Siswa',
              style: TextStyle(
                fontFamily: AllMaterial.fontFamily,
                color: AllMaterial.colorWhite,
              ),
            ),
            backgroundColor: AllMaterial.colorBlue,
            collapsedBackgroundColor: AllMaterial.colorBlue,
            trailing: Icon(
              MdiIcons.dotsVertical,
              color: AllMaterial.colorWhite,
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
