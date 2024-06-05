import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/api/firebase_api.dart';
import 'package:simon_pkl/app/modules/guru_pembimbing/laporan_pkl_siswa/detail_notifikasi_siswa/views/detail_notifikasi_siswa_view.dart';
import 'package:simon_pkl/material/allmaterial.dart';
import 'package:string_capitalize/string_capitalize.dart';
import '../controllers/notifikasi_page_controller.dart';
import 'widget_notifikasi.dart';

class NotifikasiPageView extends GetView<NotifikasiPageController> {
  NotifikasiPageView({Key? key}) : super(key: key);

  List<dynamic> notif = [2, 4];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        leading: Padding(
          padding: const EdgeInsets.all(5),
          child: SizedBox(
            width: 45,
            height: 45,
            child: Image(
              image: AssetImage("assets/logo/logo-simon-var2.png"),
            ),
          ),
        ),
        actions: [
          if (notif.isEmpty)
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                "Tandai Dibaca",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: AllMaterial.fontFamily,
                  fontWeight: AllMaterial.fontRegular,
                  color: AllMaterial.colorGrey,
                ),
              ),
            )
          else
            TextButton(
              onPressed: () {},
              child: Text(
                "Tandai Dibaca",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: AllMaterial.fontFamily,
                  fontWeight: AllMaterial.fontSemiBold,
                  color: AllMaterial.colorBlue,
                ),
              ),
            ),
        ],
      ),
      backgroundColor: AllMaterial.colorWhite,
      body: SafeArea(
        child: PageView(
          children: [
            ListView.builder(
              itemCount: notif.length,
              itemBuilder: (context, index) {
                if (notif.isEmpty) {
                  return Center(
                    child: Text(
                      "Belum ada data nih...\nKamu bakal dapet notifikasi disini",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AllMaterial.colorBlack,
                        fontFamily: AllMaterial.fontFamily,
                      ),
                    ),
                  );
                } else {
                  var _titleNotif =
                      FirebaseAPI.titleNotif.toString().capitalizeEach();
                  var _subTitleNotif = FirebaseAPI.bodyNotif.toString();
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Obx(
                      () => NotifikasiItem(
                          contextTitle: FirebaseAPI.titleNotif.toString(),
                          subTitle: FirebaseAPI.bodyNotif.toString(),
                          // contextImage: "assets/logo/accept.png",
                          onTapFunc: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return DetailNotifikasiSiswaView(
                                    isiNotif: _titleNotif,
                                    kontenNotif: _subTitleNotif,
                                  );
                                },
                              ),
                            );
                          }),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
