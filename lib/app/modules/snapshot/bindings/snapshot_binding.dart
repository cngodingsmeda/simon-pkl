import 'package:get/get.dart';

import '../controllers/snapshot_controller.dart';

class SnapshotBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SnapshotController>(
      () => SnapshotController(),
    );
  }
}
