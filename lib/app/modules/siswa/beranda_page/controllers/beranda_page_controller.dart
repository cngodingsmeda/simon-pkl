import 'package:get/get.dart';
import 'package:simon_pkl/app/modules/siswa/lokasi_pkl/controllers/lokasi_pkl_controller.dart';
import 'package:simon_pkl/app/routes/app_pages.dart';
import '../../../../../material/material.dart';

class BerandaPageController extends GetxController {
  var dataPKL = LokasiPklController();
  Future<dynamic> ambilDataDudi() async {
    Get.toNamed(Routes.LOKASI_PKL);
    await dataPKL.fetchData();
  }
  @override
  void onReady() {
    Get.reload<LokasiPklController>();
    super.onReady();
  }

  var pageIndex = 0.obs;

  void increaseIndex() {
    pageIndex.value++;
    AllMaterial.box.write("pageIndex", pageIndex.value);
    print(pageIndex.value);
  }
}
