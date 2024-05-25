import 'package:get/get.dart';

import '../controllers/pengajuan_pkl_controller.dart';

class PengajuanPklBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PengajuanPklController>(
      () => PengajuanPklController(),
    );
  }
}
