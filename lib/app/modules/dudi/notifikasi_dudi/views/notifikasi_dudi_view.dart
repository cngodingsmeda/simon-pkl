import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/material/material.dart';
import 'package:simon_pkl/app/modules/siswa/ajuan_pkl/views/ajuan_pkl_view.dart';
import 'package:simon_pkl/app/modules/dudi/notifikasi_dudi/notifikasi_dudi_widget.dart';
import '../controllers/notifikasi_dudi_controller.dart';

class NotifikasiDudiView extends GetView<NotifikasiDudiController> {
  final int notif = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                ClipPath(
                  clipper: ClipPathClass(),
                  child: Container(
                    height: 300,
                    width: Get.width,
                    color: AllMaterial.colorBlue,
                    child: SafeArea(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Notifikasi",
                                style: TextStyle(
                                  fontFamily: AllMaterial.fontFamily,
                                  color: AllMaterial.colorWhite,
                                  fontWeight: AllMaterial.fontSemiBold,
                                  fontSize: 18,
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                // margin: EdgeInsets.symmetric(vertical: 10),
                                child: Icon(
                                  Icons.notifications,
                                  size: 200,
                                  color: AllMaterial.colorWhite.withOpacity(.3),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.access_time_sharp,
                                color: AllMaterial.colorWhite,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Pesan akan terhapus dalam 24 Jam terakhir",
                                style: TextStyle(
                                  fontFamily: AllMaterial.fontFamily,
                                  fontSize: 11,
                                  color: AllMaterial.colorWhite,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 50,
                    left: 50,
                    top: context.mediaQueryPadding.top * 10.5,
                    bottom: 30,
                  ),
                  child: Container(
                    height: 55,
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AllMaterial.colorWhite,
                      boxShadow: [
                        BoxShadow(
                          color: AllMaterial.colorGrey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Notifikasi : ",
                            style: TextStyle(
                              fontFamily: AllMaterial.fontFamily,
                              fontWeight: AllMaterial.fontBold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 80,
                          decoration: BoxDecoration(
                            color: AllMaterial.colorGrey.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            '$notif',
                            style: TextStyle(
                              fontWeight: AllMaterial.fontBold,
                              fontFamily: AllMaterial.fontFamily,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          notif == 0
              ? SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Text(
                        "Belum ada pesan",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: AllMaterial.fontFamily,
                          fontSize: 20,
                          color: AllMaterial.colorGrey.withOpacity(.4),
                        ),
                      ),
                    ),
                  ),
                )
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Column(
                        children: [
                          NotifikasiItemDudi(
                            contextTitle: "Kabar baik untukmu!",
                            subTitle:
                                "Ajuan PKL-mu diterima di PT. Telkom Indonesia",
                            contextImage: "assets/logo/accept.png",
                            onTapFunc: () {
                              // Get.toNamed(RoutesName.settingsPage);
                            },
                          ),
                        ],
                      );
                    },
                    childCount: notif,
                  ),
                ),
        ],
      ),
    );
  }
}
