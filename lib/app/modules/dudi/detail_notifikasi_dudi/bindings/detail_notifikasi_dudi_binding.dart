import 'package:get/get.dart';

import '../controllers/detail_notifikasi_dudi_controller.dart';

class DetailNotifikasiDudiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailNotifikasiDudiController>(
      () => DetailNotifikasiDudiController(),
    );
  }
}
