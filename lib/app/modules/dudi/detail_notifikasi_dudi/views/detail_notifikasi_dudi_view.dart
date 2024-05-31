import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:simon_pkl/material/material.dart';

import '../controllers/detail_notifikasi_dudi_controller.dart';

class DetailNotifikasiDudiView extends GetView<DetailNotifikasiDudiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        centerTitle: true,
        leading: Container(),
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
              'Kabar baik untukmu!',
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
              'Ajuan PKL-mu diterima di PT. Telkom Indonesia, selamat bergabung!',
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
