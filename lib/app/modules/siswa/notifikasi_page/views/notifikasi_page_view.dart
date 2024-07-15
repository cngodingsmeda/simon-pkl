import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/app/modules/siswa/home_siswa/controllers/home_siswa_controller.dart';
import 'package:simon_pkl/material/allmaterial.dart';
import '../controllers/notifikasi_page_controller.dart';
import 'widget_notifikasi.dart';
import 'package:simon_pkl/app/modules/guru_pembimbing/laporan_pkl_siswa/detail_notifikasi_siswa/views/detail_notifikasi_siswa_view.dart';

class NotifikasiPageView extends GetView<NotifikasiPageController> {
  NotifikasiPageView({Key? key}) : super(key: key);
  final controller = Get.put(NotifikasiPageController());
  final notification = HomeSiswaController.notifications.obs;

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
            child: Image.asset("assets/logo/logo-simon-var2.png"),
          ),
        ),
        actions: [
          Obx(
            () => notification.isEmpty
                ? Padding(
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
                : TextButton(
                    onPressed: () {
                      // controller.notifications.clear();
                    },
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
          ),
        ],
      ),
      backgroundColor: AllMaterial.colorWhite,
      body: SafeArea(
        child: Obx(
          () {
            var reversedNotifications = notification.reversed.toList();
            return notification.isEmpty
                ? Center(
                    child: Text(
                      "Belum ada data nih...\nKamu bakal dapet notifikasi disini",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AllMaterial.colorBlack,
                        fontFamily: AllMaterial.fontFamily,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: reversedNotifications.length,
                    itemBuilder: (context, index) {
                      var notificationIndex = reversedNotifications[index];
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: NotifikasiItem(
                          contextTitle: notificationIndex.judul!.toLowerCase(),
                          subTitle: notificationIndex.isi!,
                          onTapFunc: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return DetailNotifikasiSiswaView(
                                    isiNotif: notificationIndex
                                        .judul!.capitalizeFirst!,
                                    kontenNotif: notificationIndex.isi!,
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
