import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/app/modules/siswa/lokasi_pkl/controllers/lokasi_pkl_controller.dart';

import 'package:simon_pkl/app/routes/app_pages.dart';
import 'package:simon_pkl/material/allmaterial.dart';
import 'package:string_capitalize/string_capitalize.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

class LokasiPklView extends GetView<LokasiPklController> {
  LokasiPklView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var dataCountPage = AllMaterial.box.read("dataCountPage");
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AllMaterial.colorWhite,
        backgroundColor: AllMaterial.colorWhite,
        actions: [
          Container(
            margin: const EdgeInsets.only(
              right: 8,
            ),
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
              color: AllMaterial.colorBlue,
            ),
            child: IconButton(
              onPressed: () {},
              iconSize: 20,
              color: AllMaterial.colorWhite,
              icon: const Icon(Icons.search),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              right: 8,
            ),
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
              color: AllMaterial.colorBlue,
            ),
            child: IconButton(
              onPressed: () {},
              iconSize: 20,
              color: AllMaterial.colorWhite,
              icon: const Icon(Icons.filter_alt),
            ),
          ),
        ],
      ),
      backgroundColor: AllMaterial.colorWhite,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => FutureBuilder(
                  future: controller.fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Scrollbar(
                        interactive: true,
                        child: ListView.builder(
                          physics: AlwaysScrollableScrollPhysics(),
                          itemCount: controller.dataPrevDudi.length,
                          itemBuilder: (context, index) {
                            return ExpansionTile(
                              backgroundColor: AllMaterial.colorWhite,
                              initiallyExpanded: false,
                              tilePadding: const EdgeInsets.symmetric(
                                horizontal: 5,
                              ),
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "${controller.dataPrevDudi[index]["nama_instansi_perusahaan"]}"
                                              .capitalizeEach(),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontFamily: AllMaterial.fontFamily,
                                            color: AllMaterial.colorBlack,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      (controller.dataPrevDudi[index]
                                                      ["total_siswa"] !=
                                                  null &&
                                              controller.dataPrevDudi[index]
                                                      ["total_siswa"] !=
                                                  "")
                                          ? "Siswa PKL: ${controller.dataPrevDudi[index]["total_siswa"]}"
                                          : "Siswa PKL: 0",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                              children: [
                                ListTile(
                                  leading: const Text(
                                    "Tahun :",
                                    style: TextStyle(
                                      color: AllMaterial.colorBlack,
                                      fontWeight: AllMaterial.fontMedium,
                                      fontFamily: AllMaterial.fontFamily,
                                    ),
                                  ),
                                  title: Text(
                                    "2024",
                                    style: const TextStyle(
                                      fontFamily: AllMaterial.fontFamily,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  leading: const Text(
                                    "No. Telpon :",
                                    style: TextStyle(
                                      color: AllMaterial.colorBlack,
                                      fontWeight: AllMaterial.fontMedium,
                                      fontFamily: AllMaterial.fontFamily,
                                    ),
                                  ),
                                  title: Text(
                                    "${controller.dataPrevDudi[index]["no_telepon"]}",
                                    style: const TextStyle(
                                      fontFamily: AllMaterial.fontFamily,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  leading: const Text(
                                    "Bidang :",
                                    style: TextStyle(
                                      color: AllMaterial.colorBlack,
                                      fontWeight: AllMaterial.fontMedium,
                                      fontFamily: AllMaterial.fontFamily,
                                    ),
                                  ),
                                  title: Text(
                                    "${controller.dataPrevDudi[index]["bidang"]}"
                                        .capitalizeEach(),
                                    style: const TextStyle(
                                      fontFamily: AllMaterial.fontFamily,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  leading: const Text(
                                    "Alamat :",
                                    style: TextStyle(
                                      color: AllMaterial.colorBlack,
                                      fontWeight: AllMaterial.fontMedium,
                                      fontFamily: AllMaterial.fontFamily,
                                    ),
                                  ),
                                  title: Text(
                                    "${controller.dataPrevDudi[index]["detail_tempat"]}, ${controller.dataPrevDudi[index]["desa"]}, ${controller.dataPrevDudi[index]["kecamatan"]}, ${controller.dataPrevDudi[index]["kabupaten"]}, ${controller.dataPrevDudi[index]["provinsi"]}"
                                        .capitalizeEach(),
                                    style: const TextStyle(
                                      fontFamily: AllMaterial.fontFamily,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  leading: const Text(
                                    "Deskripsi :",
                                    style: TextStyle(
                                      color: AllMaterial.colorBlack,
                                      fontWeight: AllMaterial.fontMedium,
                                      fontFamily: AllMaterial.fontFamily,
                                    ),
                                  ),
                                  title: Text(
                                    toBeginningOfSentenceCase(
                                        "${controller.dataPrevDudi[index]["deksripsi"]}"),
                                    style: const TextStyle(
                                      fontFamily: AllMaterial.fontFamily,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  leading: const Text(
                                    "Kuota :",
                                    style: TextStyle(
                                      color: AllMaterial.colorBlack,
                                      fontWeight: AllMaterial.fontMedium,
                                      fontFamily: AllMaterial.fontFamily,
                                    ),
                                  ),
                                  title: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Laki-Laki",
                                            style: TextStyle(
                                              fontFamily:
                                                  AllMaterial.fontFamily,
                                              fontWeight:
                                                  AllMaterial.fontSemiBold,
                                              color: AllMaterial.colorBlack,
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: AllMaterial.colorGreySec,
                                            ),
                                            margin:
                                                const EdgeInsets.only(left: 10),
                                            child: RichText(
                                              text: TextSpan(
                                                text: (controller.dataPrevDudi[
                                                                index][
                                                            "total_siswa_laki"] !=
                                                        null)
                                                    ? "${controller.dataPrevDudi[index]["total_siswa_laki"]}"
                                                    : "0",
                                                style: TextStyle(
                                                  fontFamily:
                                                      AllMaterial.fontFamily,
                                                  fontWeight:
                                                      AllMaterial.fontSemiBold,
                                                  color: AllMaterial.colorBlack,
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text: " / ",
                                                    style: TextStyle(
                                                      fontFamily: AllMaterial
                                                          .fontFamily,
                                                      fontWeight: AllMaterial
                                                          .fontSemiBold,
                                                      color: AllMaterial
                                                          .colorBlack,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: (controller.dataPrevDudi[
                                                                    index][
                                                                "kouta_laki"] !=
                                                            null)
                                                        ? "${controller.dataPrevDudi[index]["kouta_laki"]}"
                                                        : "0",
                                                    style: TextStyle(
                                                      fontFamily: AllMaterial
                                                          .fontFamily,
                                                      fontWeight: AllMaterial
                                                          .fontSemiBold,
                                                      color: AllMaterial
                                                          .colorBlack,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Perempuan",
                                            style: TextStyle(
                                              fontFamily:
                                                  AllMaterial.fontFamily,
                                              fontWeight:
                                                  AllMaterial.fontSemiBold,
                                              color: AllMaterial.colorBlack,
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: AllMaterial.colorGreySec,
                                            ),
                                            margin:
                                                const EdgeInsets.only(left: 10),
                                            child: RichText(
                                              text: TextSpan(
                                                text: (controller.dataPrevDudi[
                                                                index][
                                                            "total_siswa_perempuan"] !=
                                                        null)
                                                    ? "${controller.dataPrevDudi[index]["total_siswa_perempuan"]}"
                                                    : "0",
                                                style: TextStyle(
                                                  fontFamily:
                                                      AllMaterial.fontFamily,
                                                  fontWeight:
                                                      AllMaterial.fontSemiBold,
                                                  color: AllMaterial.colorBlack,
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text: " / ",
                                                    style: TextStyle(
                                                      fontFamily: AllMaterial
                                                          .fontFamily,
                                                      fontWeight: AllMaterial
                                                          .fontSemiBold,
                                                      color: AllMaterial
                                                          .colorBlack,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: (controller.dataPrevDudi[
                                                                    index][
                                                                "kouta_perempuan"] !=
                                                            null)
                                                        ? "${controller.dataPrevDudi[index]["kouta_perempuan"]}"
                                                        : "0",
                                                    style: TextStyle(
                                                      fontFamily: AllMaterial
                                                          .fontFamily,
                                                      fontWeight: AllMaterial
                                                          .fontSemiBold,
                                                      color: AllMaterial
                                                          .colorBlack,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                (controller.dataPrevDudi[index]["enabled"]
                                        .toString()
                                        .contains("true"))
                                    ? GestureDetector(
                                        onTap: () {
                                          Get.defaultDialog(
                                            middleTextStyle: TextStyle(
                                              fontFamily:
                                                  AllMaterial.fontFamily,
                                            ),
                                            backgroundColor:
                                                AllMaterial.colorWhite,
                                            radius: 10,
                                            buttonColor: AllMaterial.colorBlue,
                                            titleStyle: TextStyle(
                                                fontWeight:
                                                    AllMaterial.fontMedium),
                                            title: "Konfirmasi",
                                            middleText:
                                                "Apakah Anda yakin ingin mengajukan PKL di ${controller.dataPrevDudi[index]["nama_instansi_perusahaan"].toString().capitalizeEach()}?",
                                            onConfirm: () {
                                              // BerandaPageView.indexWidget.value == "proses";
                                              controller.postAjuanPKL(controller
                                                  .dataPrevDudi[index]["id"]);
                                              Get.back();
                                              Get.offAllNamed(
                                                Routes.AJUAN_PKL,
                                                arguments:
                                                    AllMaterial.box.write(
                                                  "selectedData",
                                                  controller
                                                      .dataPrevDudi[index],
                                                ),
                                              );
                                            },
                                            barrierDismissible: false,
                                            textCancel: "Batalkan",
                                            textConfirm: "Konfirmasi",
                                          );
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          decoration: BoxDecoration(
                                            color: AllMaterial.colorBlue,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          width: Get.width,
                                          height: 45,
                                          child: Center(
                                            child: Text(
                                              "Ajukan PKL",
                                              style: TextStyle(
                                                fontFamily:
                                                    AllMaterial.fontFamily,
                                                fontWeight:
                                                    AllMaterial.fontSemiBold,
                                                color: AllMaterial.colorWhite,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                          color: AllMaterial.colorGreySec,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        width: Get.width,
                                        height: 45,
                                        child: Center(
                                          child: Text(
                                            "Ajukan PKL",
                                            style: TextStyle(
                                              fontFamily:
                                                  AllMaterial.fontFamily,
                                              fontWeight:
                                                  AllMaterial.fontSemiBold,
                                              color: AllMaterial.colorGrey,
                                            ),
                                          ),
                                        ),
                                      ),
                                const SizedBox(height: 10),
                              ],
                            );
                          },
                        ),
                      );
                    } else {
                      return Container(
                        width: Get.width,
                        height: Get.height,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(
                                color: AllMaterial.colorBlue,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Harap Tunggu Sebentar...",
                                style: TextStyle(
                                  fontFamily: AllMaterial.fontFamily,
                                  fontSize: 18,
                                  fontWeight: AllMaterial.fontMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            Container(
              height: 65,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.dataCountPage.toInt(),
                  itemBuilder: (context, index) => Obx(
                    () => GestureDetector(
                      onTap: () {
                        controller.changePage(index);
                        controller.update();
                      },
                      child: Container(
                        width: 50,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: (controller.intPage.value == index)
                              ? AllMaterial.colorBlue
                              : AllMaterial.colorWhite,
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          "${index + 1}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: AllMaterial.fontSemiBold,
                            color: (controller.intPage.value == index)
                                ? AllMaterial.colorWhite
                                : AllMaterial.colorBlue,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
