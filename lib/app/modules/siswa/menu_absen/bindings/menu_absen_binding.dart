import 'package:get/get.dart';

import '../controllers/menu_absen_controller.dart';

class MenuAbsenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenuAbsenController>(
      () => MenuAbsenController(),
    );
  }
}
