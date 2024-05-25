import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:simon_pkl/app/modules/guru_pembimbing/laporan_pkl_siswa/views/data_siswa_pkl_widget.dart';
import 'package:simon_pkl/app/modules/siswa/ajuan_pkl/views/ajuan_pkl_view.dart';
import 'package:simon_pkl/material/material.dart';

import '../controllers/laporan_pkl_siswa_controller.dart';

class LaporanPklSiswaView extends GetView<LaporanPklSiswaController> {
  final RxBool _folded = true.obs;
  final int jumlahSiswa = 2;
  LaporanPklSiswaView({Key? key}) : super(key: key);
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
                    height: 250,
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
                                left: context.mediaQueryPadding.left + 90,
                              ),
                              child: Text(
                                "Data Siswa",
                                style: TextStyle(
                                  fontFamily: AllMaterial.fontFamily,
                                  fontSize: 35,
                                  fontWeight: AllMaterial.fontSemiBold,
                                  color: AllMaterial.colorWhite.withOpacity(.8),
                                ),
                              ),
                            ),
                            Container(
                              child: Iconify(
                                Bx.pie_chart_alt,
                                size: 210,
                                color: AllMaterial.colorWhite.withOpacity(.2),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => Padding(
                    padding: EdgeInsets.only(
                      top: 40,
                      right: 20,
                      left: 20,
                    ),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 400),
                        width: _folded.value ? 56 : Get.width,
                        height: 56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: AllMaterial.colorWhite,
                          boxShadow: kElevationToShadow[6],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 16),
                                child: !_folded.value
                                    ? TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Cari Siswa',
                                          hintStyle: TextStyle(
                                              fontFamily:
                                                  AllMaterial.fontFamily,
                                              color: AllMaterial.colorBlue),
                                          border: InputBorder.none,
                                        ),
                                      )
                                    : null,
                              ),
                            ),
                            AnimatedContainer(
                              duration: Duration(microseconds: 400),
                              child: Material(
                                type: MaterialType.transparency,
                                child: InkWell(
                                  borderRadius: BorderRadius.only(
                                    topLeft:
                                        Radius.circular(_folded.value ? 32 : 0),
                                    topRight: Radius.circular(32),
                                    bottomLeft:
                                        Radius.circular(_folded.value ? 32 : 0),
                                    bottomRight: Radius.circular(32),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Icon(
                                      _folded.value
                                          ? Icons.search
                                          : Icons.close,
                                      color: AllMaterial.colorBlue,
                                    ),
                                  ),
                                  onTap: () {
                                    _folded.value = !_folded.value;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 15),
          ),
          jumlahSiswa == 0
              ? SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Text(
                        "Belum ada data",
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
                          DataSiswaPklWidget(
                            kelas: "XII RPL 2",
                            namaSiswa: 'Rinaldi',
                            nisn: 2012039,
                            agama: 'Islam',
                            jenisKelamin: 'Laki',
                            jurusan: 'RPL',
                            noTelepon: 123456,
                            instansiSiswa: "PT. Lorem Ipsum Dolor Sit Amet",
                          )
                        ],
                      );
                    },
                    childCount: jumlahSiswa,
                  ),
                ),
        ],
      ),
    );
  }
}
