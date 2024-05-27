import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/material/material.dart';

class MonitoringSiswaWidget extends StatelessWidget {
  MonitoringSiswaWidget({
    required this.nama,
    required this.kelas,
    required this.instansi,
    required this.jamMasuk,
    required this.jamPulang,
  });

  final String nama;
  final dynamic kelas;
  final String instansi;
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 10,
                        right: 10,
                        left: 10,
                      ),
                      height: 27,
                      width: Get.width * .37,
                      decoration: BoxDecoration(
                        color: AllMaterial.colorBlue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          top: 2,
                        ),
                        child: Text(
                          nama,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: AllMaterial.fontFamily,
                            fontWeight: AllMaterial.fontSemiBold,
                            color: AllMaterial.colorWhite,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 2,
                      ),
                      child: Text(
                        '$kelas',
                        style: TextStyle(
                          fontFamily: AllMaterial.fontFamily,
                          fontWeight: AllMaterial.fontBold,
                          fontSize: 13,
                          color: AllMaterial.colorGrey.withOpacity(.6),
                        ),
                      ),
                    ),
                  ],
                ),

                // Vertical Divider
                Container(
                  width: 1,
                  height: Get.height * .095,
                  color: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
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
                              fontSize: 12,
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
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: AllMaterial.colorWhite,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.green,
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
                              fontSize: 12,
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
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: AllMaterial.colorWhite,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
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
                horizontal: 30,
                vertical: 5,
              ),
              child: Text(
                instansi,
                style: TextStyle(
                  fontFamily: AllMaterial.fontFamily,
                  fontWeight: AllMaterial.fontBold,
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
