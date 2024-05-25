import 'package:get/get.dart';

import '../controllers/monitoring_siswa_dudi_controller.dart';

class MonitoringSiswaDudiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MonitoringSiswaDudiController>(
      () => MonitoringSiswaDudiController(),
    );
  }
}
