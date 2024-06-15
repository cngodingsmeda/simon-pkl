import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/material/allmaterial.dart';
import '../controllers/notifikasi_page_controller.dart';
import 'widget_notifikasi.dart';
import 'package:simon_pkl/app/modules/guru_pembimbing/laporan_pkl_siswa/detail_notifikasi_siswa/views/detail_notifikasi_siswa_view.dart';

class NotifikasiPageView extends GetView<NotifikasiPageController> {
  NotifikasiPageView({Key? key}) : super(key: key);
  var controller = Get.put(NotifikasiPageController());
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
          Obx(
            () => controller.notifications.isEmpty
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
                      controller.notifications.clear();
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
          () => controller.notifications.isEmpty
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
                  itemCount: controller.notifications.length,
                  itemBuilder: (context, index) {
                    var notification = controller.notifications[index];
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: NotifikasiItem(
                        contextTitle: notification['title']?.toLowerCase() ?? 'No Title',
                        subTitle: notification['body'] ?? 'No Body',
                        onTapFunc: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return DetailNotifikasiSiswaView(
                                  isiNotif: notification['title']?.toLowerCase() ?? 'No Title',
                                  kontenNotif:
                                      notification['body'] ?? 'No Body',
                                );
                              },
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
