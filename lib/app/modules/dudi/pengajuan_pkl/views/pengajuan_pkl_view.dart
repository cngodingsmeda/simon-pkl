import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simon_pkl/app/modules/siswa/ajuan_pkl/views/ajuan_pkl_view.dart';

import '../controllers/pengajuan_pkl_controller.dart';
import 'package:simon_pkl/material/material.dart';

// ignore: must_be_immutable
class PengajuanPklView extends GetView<PengajuanPklController> {
  // const PengajuanPklView({Key? key}) : super(key: key);
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
                                top: context.mediaQueryPadding.top + 100,
                                left: context.mediaQueryPadding.left + 50,
                              ),
                              child: Text(
                                "Pengajuan PKL",
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
                                Icons.person,
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
                    left: context.mediaQueryPadding.left + 30,
                    top: context.mediaQueryPadding.top * 10.5,
                    bottom: context.mediaQueryPadding.bottom + 20,
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
                            "Total Pengajuan : ",
                            style: TextStyle(
                              fontFamily: AllMaterial.fontFamily,
                              fontWeight: AllMaterial.fontSemiBold,
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
                            '$TotalPengajuan',
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
          SliverToBoxAdapter(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 180),
                  child: Divider(
                    thickness: 2,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: Get.height * .21,
                    horizontal: 100,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(Get.width, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: AllMaterial.colorBlue,
                      foregroundColor: AllMaterial.colorWhite,
                    ),
                    onPressed: () {},
                    child: Text(
                      'Buat Form',
                      style: TextStyle(
                          fontFamily: AllMaterial.fontFamily, fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
