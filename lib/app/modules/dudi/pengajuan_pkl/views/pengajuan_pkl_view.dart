import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:simon_pkl/app/modules/siswa/ajuan_pkl/views/ajuan_pkl_view.dart';

import '../controllers/pengajuan_pkl_controller.dart';
import 'package:simon_pkl/material/allmaterial.dart';

//ignore: must_be_immutable
class PengajuanPklView extends GetView<PengajuanPklController> {
  int TotalPengajuan = 0;
  var controller = Get.put(PengajuanPklController());

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
                              margin: EdgeInsets.symmetric(vertical: 10),
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
                    bottom: context.mediaQueryPadding.bottom + 10,
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: Get.height,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AllMaterial.colorBlack,
                        width: 1,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 45,
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Text(
                                      'Form Rekrut Siswa PKL',
                                      style: TextStyle(
                                        fontFamily: AllMaterial.fontFamily,
                                        fontSize: 17,
                                        fontWeight: AllMaterial.fontSemiBold,
                                        color: AllMaterial.colorWhite,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 100,
                              width: Get.width * .35,
                              decoration: BoxDecoration(
                                color: Colors.blue[800],
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                            ),
                            Container(
                              height: 100,
                              width: Get.width * .28,
                              decoration: BoxDecoration(
                                color: Colors.blue[900],
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              child: Icon(
                                MdiIcons.accountPlus,
                                color: AllMaterial.colorWhite.withOpacity(.7),
                                size: 80,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              width: Get.width * .4,
                              height: 35,
                              decoration: BoxDecoration(
                                color: Color(0xff979DAC),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  'Banyak Siswa :',
                                  style: TextStyle(
                                    fontFamily: AllMaterial.fontFamily,
                                    fontWeight: AllMaterial.fontSemiBold,
                                    color: AllMaterial.colorBlack,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Laki - Laki    :',
                                      style: TextStyle(
                                        fontFamily: AllMaterial.fontFamily,
                                        fontWeight: AllMaterial.fontBold,
                                        color: AllMaterial.colorBlack,
                                        fontSize: 12,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Center(
                                      child: Container(
                                        height: 35,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: TextField(
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(2),
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                          ],
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Perempuan  :',
                                      style: TextStyle(
                                        fontFamily: AllMaterial.fontFamily,
                                        fontWeight: AllMaterial.fontBold,
                                        color: AllMaterial.colorBlack,
                                        fontSize: 11.9,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Center(
                                      child: Container(
                                        height: 35,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: TextField(
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(2),
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                          ],
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Jumlah         :',
                                      style: TextStyle(
                                        fontFamily: AllMaterial.fontFamily,
                                        fontWeight: AllMaterial.fontBold,
                                        color: AllMaterial.colorBlack,
                                        fontSize: 12.3,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Center(
                                      child: Container(
                                        height: 35,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: TextField(
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(2),
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                          ],
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                          readOnly: true,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FormJurusanSiswaWidget(),
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
                        fontFamily: AllMaterial.fontFamily,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FormJurusanSiswaWidget extends StatelessWidget {
  const FormJurusanSiswaWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * .17,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 0),
                child: Text(
                  'Jurusan : ',
                  style: TextStyle(
                    fontFamily: AllMaterial.fontFamily,
                    fontWeight: AllMaterial.fontSemiBold,
                    fontSize: 17,
                  ),
                ),
              ),
              Expanded(
                child: ExpansionTile(
                  backgroundColor: AllMaterial.colorGreySec,
                  collapsedBackgroundColor: AllMaterial.colorGreySec,
                  collapsedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  title: Text(
                    'Akuntansi dan Keuangan',
                    style: TextStyle(
                      fontFamily: AllMaterial.fontFamily,
                      fontWeight: AllMaterial.fontSemiBold,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      decoration: BoxDecoration(
        color: Color(0xff979DAC),
        border: Border.symmetric(
          horizontal: BorderSide(
            color: AllMaterial.colorBlack,
          ),
        ),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
