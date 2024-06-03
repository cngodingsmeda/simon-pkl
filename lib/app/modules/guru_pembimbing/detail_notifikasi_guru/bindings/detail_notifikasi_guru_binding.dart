import 'package:get/get.dart';

import '../controllers/detail_notifikasi_guru_controller.dart';

class DetailNotifikasiGuruBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailNotifikasiGuruController>(
      () => DetailNotifikasiGuruController(),
    );
  }
}
