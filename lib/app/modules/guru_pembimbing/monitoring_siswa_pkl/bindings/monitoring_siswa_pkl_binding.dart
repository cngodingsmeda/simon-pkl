import 'package:get/get.dart';

import '../controllers/monitoring_siswa_pkl_controller.dart';

class MonitoringSiswaPklBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MonitoringSiswaPklController>(
      () => MonitoringSiswaPklController(),
    );
  }
}
