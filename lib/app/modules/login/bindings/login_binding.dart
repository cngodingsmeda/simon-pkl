import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginSiswaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
