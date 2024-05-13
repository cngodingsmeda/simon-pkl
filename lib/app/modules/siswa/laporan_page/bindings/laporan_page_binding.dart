import 'package:get/get.dart';

import '../controllers/laporan_page_controller.dart';

class LaporanPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaporanPageController>(
      () => LaporanPageController(),
    );
  }
}
