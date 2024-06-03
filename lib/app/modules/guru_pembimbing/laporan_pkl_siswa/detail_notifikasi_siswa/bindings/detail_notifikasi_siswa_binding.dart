import 'package:get/get.dart';

import '../controllers/detail_notifikasi_siswa_controller.dart';

class DetailNotifikasiSiswaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailNotifikasiSiswaController>(
      () => DetailNotifikasiSiswaController(),
    );
  }
}
