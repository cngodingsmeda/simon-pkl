import 'package:get/get.dart';

import '../controllers/absen_diluar_radius_controller.dart';

class AbsenDiluarRadiusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AbsenDiluarRadiusController>(
      () => AbsenDiluarRadiusController(),
    );
  }
}
