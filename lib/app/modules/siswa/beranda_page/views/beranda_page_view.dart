import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:simon_pkl/material/allmaterial.dart';
import '../controllers/beranda_page_controller.dart';

class BerandaPageView extends GetView<BerandaPageController> {
  BerandaPageView({Key? key}) : super(key: key);
  final controllerBP = Get.put(BerandaPageController());
  static var indexWidget = "".obs;

  @override
  Widget build(BuildContext context) {
    controllerBP.findStatusSiswa();
    return Obx(() {
      print("indexWidget sekarang: ${indexWidget.value}");
      if (indexWidget.value == "belum_pkl") {
        return HomePageNol();
      } else if (indexWidget.value == "proses" || indexWidget.value == "pending") {
        return HomePageSatu();
      } else if (indexWidget.value == "pkl") {
        return HomePageDua();
      } else {
        return HomePageNol();
      }
    });
  }
}
