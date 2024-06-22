import 'package:get/get.dart';

import '../controllers/absen_telat_controller.dart';

class AbsenTelatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AbsenTelatController>(
      () => AbsenTelatController(),
    );
  }
}
