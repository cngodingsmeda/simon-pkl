import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simon_pkl/app/modules/siswa/notifikasi_page/widget_notifikasi.dart';
import 'package:simon_pkl/material/material.dart';

import '../controllers/notifikasi_page_controller.dart';

// ignore: must_be_immutable
class NotifikasiPageView extends GetView<NotifikasiPageController> {
  NotifikasiPageView({Key? key}) : super(key: key);
  var notif = 15;

  Map contextImageURL = {
    "acceptImage": "assets/logo/accept.png",
    "declineImage": "assets/logo/decline.png",
    "pendingImage": "assets/logo/pending.png",
  };
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AllMaterial.colorWhite,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              snap: true,
              floating: true,
              backgroundColor: AllMaterial.colorWhite,
              surfaceTintColor: AllMaterial.colorWhite,
              leading: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: SizedBox(
                      width: 45,
                      height: 45,
                      child: Image(
                        image: AssetImage("assets/logo/logo-simon-var2.png"),
                      ),
                    ),
                  ),
                ],
              ),
              actions: [
                (notif == 0)
                    ? const Padding(
                        padding: EdgeInsets.all(12),
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
                        onPressed: () {},
                        child: const Text(
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
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  childCount: notif,
                  (context, index) => (notif == 0)
                      ? const Center(
                          child: Text(
                            "Belum ada data nih...\nKamu bakal dapet notifikasi disini",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontFamily: AllMaterial.fontFamily),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(10),
                          child: NotifikasiItem(
                            contextTitle: "Kabar baik untukmu!",
                            subTitle:
                                "Ajuan PKL-mu diterima di PT. Telkom Indonesia",
                            contextImage: "assets/logo/accept.png",
                            onTapFunc: () {
                              // Get.toNamed(RoutesName.settingsPage);
                            },
                          ),
                        )),
            ),
          ],
        ),
      ),
    );
  }
}
