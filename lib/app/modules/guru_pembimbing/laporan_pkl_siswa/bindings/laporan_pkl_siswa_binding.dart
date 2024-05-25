import 'package:get/get.dart';

import '../controllers/laporan_pkl_siswa_controller.dart';

class LaporanPklSiswaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaporanPklSiswaController>(
      () => LaporanPklSiswaController(),
    );
  }
}
