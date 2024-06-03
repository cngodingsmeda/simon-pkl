import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:simon_pkl/app/modules/dudi/pengaturan_jadwal_dudi/views/pengaturan_jadwal_dudi_dialog.dart';
import 'package:simon_pkl/app/modules/dudi/pengaturan_jadwal_dudi/views/pengaturan_jadwal_dudi_widget.dart';
import 'package:simon_pkl/app/modules/siswa/ajuan_pkl/views/ajuan_pkl_view.dart';

import 'package:simon_pkl/material/allmaterial.dart';

import '../controllers/pengaturan_jadwal_dudi_controller.dart';

// ignore: must_be_immutable
class PengaturanJadwalDudiView extends GetView<PengaturanJadwalDudiController> {
  int totalJadwal = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.back();
        },
        backgroundColor: AllMaterial.colorBlue,
        foregroundColor: AllMaterial.colorWhite,
        tooltip: 'Back',
        child: Icon(
          Icons.arrow_back,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: context.mediaQueryPadding.top + 110,
                                left: context.mediaQueryPadding.left + 10,
                              ),
                              child: Text(
                                "Pengaturan Jadwal",
                                style: TextStyle(
                                  fontFamily: AllMaterial.fontFamily,
                                  fontSize: 35,
                                  fontWeight: AllMaterial.fontSemiBold,
                                  color: AllMaterial.colorWhite.withOpacity(.8),
                                ),
                              ),
                            ),
                            Container(
                              // margin: EdgeInsets.symmetric(vertical: 10),
                              child: Icon(
                                Icons.calendar_month_outlined,
                                size: 235,
                                color: AllMaterial.colorWhite.withOpacity(.2),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: context.mediaQueryPadding.right + 30,
                    left: context.mediaQueryPadding.left + 290,
                    top: context.mediaQueryPadding.top + 220,
                    bottom: context.mediaQueryPadding.bottom + 20,
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      Get.dialog(PengaturanJadwalDudiDialog());
                    },
                    child: Container(
                      width: 70,
                      height: 70,
                      child: Icon(
                        MdiIcons.plus,
                        size: 60,
                        color: Colors.blue[700],
                      ),
                      decoration: BoxDecoration(
                        color: AllMaterial.colorGreySec,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: Colors.blue.shade600,
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AllMaterial.colorGrey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 8,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          totalJadwal == 0
              ? SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 60),
                      child: Text(
                        "Belum ada Jadwal",
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
                      return PengaturanJadwalDudiWidget();
                    },
                    childCount: totalJadwal,
                  ),
                ),
        ],
      ),
    );
  }
}
