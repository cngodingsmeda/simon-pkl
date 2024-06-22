// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/material/allmaterial.dart';

import '../controllers/absen_masuk_controller.dart';

class AbsenMasukView extends GetView<AbsenMasukController> {
  const AbsenMasukView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AbsenMasukController());

    RxBool isButtonDisabled() {
      return (controller.imageAbsen.value.path.isNotEmpty).obs;
    }

    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        title: const Text('Absen Masuk'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(25),
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AllMaterial.colorBlue.withOpacity(0.9),
                boxShadow: [
                  BoxShadow(
                    color: AllMaterial.colorGreySec,
                    spreadRadius: 0.2,
                    blurRadius: 8,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // DATE TIME
                  Text(
                    "28 Maret 2024 - 7:11:46 AM",
                    style: TextStyle(
                      color: AllMaterial.colorWhite,
                    ),
                  ),

                  Divider(color: AllMaterial.colorWhite),
                  SizedBox(height: 15),

                  // PREVIEW FOTO
                  GestureDetector(
                    onTap: () {
                      Get.bottomSheet(Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                        width: Get.width,
                        height: 100,
                        decoration: BoxDecoration(
                          color: AllMaterial.colorWhite,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: 10),
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Get.back();
                                    controller.pickImageFromGallery();
                                  },
                                  icon: Icon(
                                    Icons.photo,
                                    size: 35,
                                  ),
                                  color: AllMaterial.colorGrey,
                                ),
                                Text("From Gallery"),
                              ],
                            ),
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Get.back();
                                    controller.pickImageFromCamera();
                                  },
                                  icon: Icon(
                                    Icons.camera_alt,
                                    size: 35,
                                  ),
                                  color: AllMaterial.colorGrey,
                                ),
                                Text("From Camera"),
                              ],
                            ),
                            SizedBox(width: 10),
                          ],
                        ),
                      ));
                    },
                    child: Obx(
                      () => Container(
                        height: Get.height * 0.4,
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AllMaterial.colorGreySec,
                        ),
                        child: controller.imageAbsen.value.path.isEmpty
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.camera_alt,
                                    color: AllMaterial.colorGrey,
                                    size: 35,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Klik Untuk Menambah Foto",
                                    style: TextStyle(
                                      color: AllMaterial.colorGrey,
                                    ),
                                  ),
                                ],
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.file(
                                  controller.imageAbsen.value,
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                    ),
                  ),

                  SizedBox(height: 15),

                  // BUTTON
                  ElevatedButton(
                    onPressed: () async {
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: AllMaterial.colorBlue,
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Setel Lokasi",
                          style: TextStyle(
                            color: AllMaterial.colorBlue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // TODO: KALO UDAH CEK RADIUS, ISI INI
                  // Obx(
                  //   () => (isButtonDisabled().value &&
                  //           controller.latitudeSiswa != 0)
                  //       ? ElevatedButton(
                  //           style: ElevatedButton.styleFrom(
                  //             backgroundColor: AllMaterial.colorWhite,
                  //             fixedSize: Size(Get.width, 25),
                  //           ),
                  //           onPressed: () {
                  //             print(controller.latitudeSiswa);
                  //             print(controller.imageAbsen.value.path);
                  //           },
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             children: [
                  //               Icon(
                  //                 Icons.check,
                  //                 color: AllMaterial.colorBlue,
                  //                 size: 20,
                  //               ),
                  //               SizedBox(width: 10),
                  //               Text(
                  //                 "Absen Masuk",
                  //                 style: TextStyle(
                  //                   color: AllMaterial.colorBlue,
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         )
                  //       : ElevatedButton(
                  //           style: ElevatedButton.styleFrom(
                  //             backgroundColor: AllMaterial.colorWhite,
                  //             fixedSize: Size(Get.width, 25),
                  //           ),
                  //           onPressed: null,
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             children: [
                  //               SizedBox(width: 10),
                  //               Text( 
                  //                 "Absen Masuk",
                  //                 style: TextStyle(
                  //                   color: AllMaterial.colorGrey,
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
