import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:simon_pkl/material/allmaterial.dart';

import '../controllers/detail_notifikasi_siswa_controller.dart';

class DetailNotifikasiSiswaView
    extends GetView<DetailNotifikasiSiswaController> {
  String? isiNotif;
  String? kontenNotif;
  DetailNotifikasiSiswaView({Key? key, this.isiNotif, this.kontenNotif}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        centerTitle: true,
        leading: SizedBox(),
        // leadingWidth: 0,
        backgroundColor: AllMaterial.colorWhite,
        title: Text(
          'Detail Notifikasi',
          style: TextStyle(
            fontFamily: AllMaterial.fontFamily,
            // fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 35,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${DateFormat("d MMMM yyyy - H.m", "id_ID").format(
                DateTime.now(),
              )}',
              style: TextStyle(
                fontFamily: AllMaterial.fontFamily,
                fontSize: 13,
                color: AllMaterial.colorGrey.withOpacity(.5),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              isiNotif.toString(),
              style: TextStyle(
                fontFamily: AllMaterial.fontFamily,
                fontSize: 19,
                fontWeight: AllMaterial.fontBold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              kontenNotif.toString(),
              style: TextStyle(
                fontFamily: AllMaterial.fontFamily,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          style: ButtonStyle(
            fixedSize: WidgetStatePropertyAll(
              Size(Get.width, 50),
            ),
            backgroundColor: WidgetStatePropertyAll(
              AllMaterial.colorBlue,
            ),
          ),
          onPressed: () {
            Get.back();
          },
          child: const Text(
            "Kembali Ke Beranda",
            style: TextStyle(
              fontSize: 17,
              fontFamily: AllMaterial.fontFamily,
              fontWeight: AllMaterial.fontSemiBold,
              color: AllMaterial.colorWhite,
            ),
          ),
        ),
      ),
    );
  }
}
