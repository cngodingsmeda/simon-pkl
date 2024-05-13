import 'package:get/get.dart';

import '../controllers/home_page_dudi_controller.dart';

class HomePageDudiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageDudiController>(
      () => HomePageDudiController(),
    );
  }
}
