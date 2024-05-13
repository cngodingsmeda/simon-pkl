import 'package:get/get.dart';
import 'package:simon_pkl/app/modules/login/controllers/login_controller.dart';

class HomeDudiController extends GetxController {
  var loginC = LoginController();
  @override
  void onInit() {
    loginC.textBodyC.clear();
    loginC.pwC.clear();
    super.onInit();
  }

  RxInt indexWidget = 0.obs;
  void changeIndexBottomNav(int index) {
    indexWidget.value = index;
  }
}
