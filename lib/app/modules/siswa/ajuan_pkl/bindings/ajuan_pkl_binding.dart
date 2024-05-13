import 'package:get/get.dart';

import '../controllers/ajuan_pkl_controller.dart';

class AjuanPklBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AjuanPklController>(
      () => AjuanPklController(),
    );
  }
}
