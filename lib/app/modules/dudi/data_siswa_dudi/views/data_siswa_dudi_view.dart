import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:simon_pkl/app/modules/dudi/data_siswa_dudi/data_siswa_widget.dart';
import 'package:simon_pkl/app/modules/siswa/ajuan_pkl/views/ajuan_pkl_view.dart';
import 'package:simon_pkl/material/material.dart';

import '../controllers/data_siswa_dudi_controller.dart';

class DataSiswaDudiView extends GetView<DataSiswaDudiController> {
  final RxBool _folded = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      body: SingleChildScrollView(
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [],
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
                                      hintText: 'Search',
                                      hintStyle: TextStyle(
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
                                  _folded.value ? Icons.search : Icons.close,
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
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(right: 180, top: 50),
              child: Icon(
                MdiIcons.textBoxSearchOutline,
                size: 210,
                color: AllMaterial.colorWhite.withOpacity(.2),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 90,
                top: 150,
                left: 90,
                right: 90,
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
            Column(
              children: [
                SizedBox(
                  height: Get.height * 0.33,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70),
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
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            "Siswa : ",
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
                            '0',
                            style: TextStyle(
                              fontWeight: AllMaterial.fontBold,
                              fontFamily: AllMaterial.fontFamily,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        // SizedBox(width: 10),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: context.mediaQueryPadding.top * 14),
              child: Divider(
                thickness: 2,
                color: AllMaterial.colorBlack.withOpacity(.4),
              ),
            ),
            DataSiswaWidget(
              namaSiswa: 'Adit',
              nisn: 2012039,
              agama: 'Islam',
              jenisKelamin: 'Laki',
              jurusan: 'RPL',
              noTelepon: 123456,
            )
          ],
        ),
      ),
    );
  }
}
