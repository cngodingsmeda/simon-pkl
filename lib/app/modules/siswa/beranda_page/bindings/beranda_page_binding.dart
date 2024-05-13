import 'package:get/get.dart';

import '../controllers/beranda_page_controller.dart';

class BerandaPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BerandaPageController>(
      () => BerandaPageController(),
    );
  }
}
