import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:simon_pkl/app/modules/siswa/ajuan_pkl/views/ajuan_pkl_view.dart';

import 'package:simon_pkl/material/material.dart';
import '../controllers/pengaturan_jadwal_dudi_controller.dart';

// ignore: must_be_immutable
class PengaturanJadwalDudiView extends GetView<PengaturanJadwalDudiController> {
  // final RxBool _folded = true.obs;
  int TotalPengajuan = 0;

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
                // Obx(
                //   () => Padding(
                //     padding: EdgeInsets.only(
                //       top: 40,
                //       right: 20,
                //       left: 20,
                //     ),
                //     child: Align(
                //       alignment: Alignment.centerRight,
                //       child: AnimatedContainer(
                //         duration: Duration(milliseconds: 400),
                //         width: _folded.value ? 56 : Get.width,
                //         height: 56,
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(32),
                //           color: AllMaterial.colorWhite,
                //           boxShadow: kElevationToShadow[6],
                //         ),
                //         child: Row(
                //           children: [
                //             Expanded(
                //               child: Container(
                //                 padding: EdgeInsets.only(left: 16),
                //                 child: !_folded.value
                //                     ? TextField(
                //                         decoration: InputDecoration(
                //                           hintText: 'Cari Pengajuan PKL',
                //                           hintStyle: TextStyle(
                //                             fontFamily: AllMaterial.fontFamily,
                //                             color: AllMaterial.colorBlue,
                //                           ),
                //                           border: InputBorder.none,
                //                         ),
                //                       )
                //                     : null,
                //               ),
                //             ),
                //             AnimatedContainer(
                //               duration: Duration(microseconds: 400),
                //               child: Material(
                //                 type: MaterialType.transparency,
                //                 child: InkWell(
                //                   borderRadius: BorderRadius.only(
                //                     topLeft:
                //                         Radius.circular(_folded.value ? 32 : 0),
                //                     topRight: Radius.circular(32),
                //                     bottomLeft:
                //                         Radius.circular(_folded.value ? 32 : 0),
                //                     bottomRight: Radius.circular(32),
                //                   ),
                //                   child: Padding(
                //                     padding: const EdgeInsets.all(16.0),
                //                     child: Icon(
                //                       _folded.value
                //                           ? Icons.search
                //                           : Icons.close,
                //                       color: AllMaterial.colorBlue,
                //                     ),
                //                   ),
                //                   onTap: () {
                //                     _folded.value = !_folded.value;
                //                   },
                //                 ),
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.only(
                    right: context.mediaQueryPadding.right + 30,
                    left: context.mediaQueryPadding.left + 290,
                    top: context.mediaQueryPadding.top + 220,
                    bottom: context.mediaQueryPadding.bottom + 20,
                  ),
                  child: InkWell(
                    onTap: () {},
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
          SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: Get.height * 0.22),
                child: Text(
                  "Belum ada jadwal",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AllMaterial.fontFamily,
                    fontSize: 20,
                    color: AllMaterial.colorGrey.withOpacity(.4),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
