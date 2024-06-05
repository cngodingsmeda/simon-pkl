// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:simon_pkl/material/allmaterial.dart';

import '../controllers/beranda_page_controller.dart';

class BerandaPageView extends GetView<BerandaPageController> {
  BerandaPageView({Key? key}) : super(key: key);


  static var ip = 0.obs;
  @override
  Widget build(BuildContext context) {
    print(ip.value);

    return Obx(() {
      if (ip.value == 0) {
      return HomePageNol();
    } else if (ip.value == 1) {
      return HomePageSatu();
    } else if (ip.value == 2) {
      return HomePageDua();
    } else {
      return HomePageNol();
    }
    });
  }
}
