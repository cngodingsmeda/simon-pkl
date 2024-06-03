import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simon_pkl/app/modules/siswa/ajuan_pkl/views/ajuan_pkl_view.dart';
import 'package:simon_pkl/material/allmaterial.dart';
import 'package:simon_pkl/app/modules/dudi/monitoring_siswa_dudi/monitoring_siswa_widget.dart';
import 'package:intl/intl.dart';

import '../controllers/monitoring_siswa_dudi_controller.dart';

// ignore: must_be_immutable
class MonitoringSiswaDudiView extends GetView<MonitoringSiswaDudiController> {
  final RxBool _folded = true.obs;
  int SiswaDibimbing = 1;

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
                                left: context.mediaQueryPadding.left + 30,
                              ),
                              child: Text(
                                "Monitoring Siswa",
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
                                Icons.monitor,
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
                                          hintText: 'Tanggal, Absen',
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
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            "Siswa Yang Dibimbing: ",
                            style: TextStyle(
                              fontFamily: AllMaterial.fontFamily,
                              fontWeight: AllMaterial.fontBold,
                              fontSize: 16,
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
                            '$SiswaDibimbing',
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
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Stack(
                  children: [
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'History Time',
                            style: TextStyle(
                              color: AllMaterial.colorWhite,
                            ),
                          ),
                        ),
                        width: Get.width * .4,
                        height: 22,
                        decoration: BoxDecoration(
                          color: Colors.blue[700],
                          borderRadius: BorderRadiusDirectional.circular(5),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: SiswaDibimbing,
              (context, index) => MonitoringSiswaWidget(
                nama: 'Arya Dwi Nitinegara',
                kelas: 'XII RPL 2',
                instansi: 'Bayan Tech',
                jamMasuk: DateFormat.Hms().format(DateTime.now()),
                jamPulang: DateFormat.Hms().format(DateTime.now()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
