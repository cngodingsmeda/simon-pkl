import 'package:get/get.dart';

import '../controllers/lokasi_pkl_controller.dart';

class LokasiPklBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LokasiPklController>(
      () => LokasiPklController(),
    );
  }
}
