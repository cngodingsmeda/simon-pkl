import 'package:get/get.dart';

import '../controllers/pengaturan_jadwal_dudi_controller.dart';

class PengaturanJadwalDudiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PengaturanJadwalDudiController>(
      () => PengaturanJadwalDudiController(),
    );
  }
}
