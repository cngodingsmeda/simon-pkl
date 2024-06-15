import 'package:get/get.dart';

import '../controllers/absen_keluar_controller.dart';

class AbsenKeluarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AbsenKeluarController>(
      () => AbsenKeluarController(),
    );
  }
}
