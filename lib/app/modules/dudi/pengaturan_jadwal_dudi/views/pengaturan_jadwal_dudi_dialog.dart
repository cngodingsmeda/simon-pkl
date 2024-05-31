import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:simon_pkl/app/modules/dudi/pengaturan_jadwal_dudi/controllers/pengaturan_jadwal_dudi_controller.dart';
import 'package:simon_pkl/material/material.dart';

class PengaturanJadwalDudiDialog
    extends GetView<PengaturanJadwalDudiController> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AllMaterial.colorWhite,
      surfaceTintColor: AllMaterial.colorWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: AllMaterial.colorBlue,
          width: 1.5,
        ),
      ),
      content: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: Get.width,
            height: Get.height * .57, // set height
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Jam Masuk : ',
                    style: TextStyle(
                      fontFamily: AllMaterial.fontFamily,
                      fontSize: 20,
                      fontWeight: AllMaterial.fontSemiBold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    hintText: 'Masukkan Jadwal Jam',
                    contentPadding: EdgeInsets.all(16.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(),
                    ),
                  ),
                  style: TextStyle(
                    fontFamily: AllMaterial.fontFamily,
                    fontWeight: AllMaterial.fontSemiBold,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Jam Pulang : ',
                    style: TextStyle(
                      fontFamily: AllMaterial.fontFamily,
                      fontSize: 20,
                      fontWeight: AllMaterial.fontSemiBold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    hintText: 'Masukkan Jadwal Jam',
                    contentPadding: EdgeInsets.all(16.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  style: TextStyle(
                    fontFamily: AllMaterial.fontFamily,
                    fontWeight: AllMaterial.fontSemiBold,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    children: [
                      Text(
                        'Awal',
                        style: TextStyle(
                          fontFamily: AllMaterial.fontFamily,
                          fontWeight: AllMaterial.fontSemiBold,
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Text(
                        'Akhir',
                        style: TextStyle(
                          fontFamily: AllMaterial.fontFamily,
                          fontWeight: AllMaterial.fontSemiBold,
                          fontSize: 17,
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      child: Container(
                        width: Get.width * .3,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              child: TextField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(2),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                  fontFamily: AllMaterial.fontFamily,
                                  fontWeight: AllMaterial.fontSemiBold,
                                  fontSize: 13,
                                ),
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  hintText: 'DD',
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 8),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Container(
                              width: 1,
                              height: 50,
                              color: Colors.black,
                            ),
                            Flexible(
                              child: TextField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(2),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                  fontFamily: AllMaterial.fontFamily,
                                  fontWeight: AllMaterial.fontSemiBold,
                                  fontSize: 13,
                                ),
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  hintText: 'MM',
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 4),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Container(
                              width: 1,
                              height: 50,
                              color: Colors.black,
                            ),
                            Flexible(
                              child: TextField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(2),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                  fontFamily: AllMaterial.fontFamily,
                                  fontWeight: AllMaterial.fontSemiBold,
                                  fontSize: 13,
                                ),
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  hintText: 'YY',
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 8),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Flexible(
                      child: Container(
                        width: Get.width * .3,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              child: TextField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(2),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                  fontFamily: AllMaterial.fontFamily,
                                  fontWeight: AllMaterial.fontSemiBold,
                                  fontSize: 13,
                                ),
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  hintText: 'DD',
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 8),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Container(
                              width: 1,
                              height: 50,
                              color: Colors.black,
                            ),
                            Flexible(
                              child: TextField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(2),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                  fontFamily: AllMaterial.fontFamily,
                                  fontWeight: AllMaterial.fontSemiBold,
                                  fontSize: 13,
                                ),
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  hintText: 'MM',
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 4),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Container(
                              width: 1,
                              height: 50,
                              color: Colors.black,
                            ),
                            Flexible(
                              child: TextField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(2),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                  fontFamily: AllMaterial.fontFamily,
                                  fontWeight: AllMaterial.fontSemiBold,
                                  fontSize: 13,
                                ),
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  hintText: 'YY',
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 8),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Tentukan Lokasi Absen'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      foregroundColor: AllMaterial.colorBlack,
                      textStyle: TextStyle(
                        fontFamily: AllMaterial.fontFamily,
                        fontSize: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Buat'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AllMaterial.colorBlue,
              foregroundColor: AllMaterial.colorWhite,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              textStyle: TextStyle(
                fontFamily: AllMaterial.fontFamily,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
