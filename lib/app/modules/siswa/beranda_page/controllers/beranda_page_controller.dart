import 'package:get/get.dart';
import 'package:simon_pkl/app/modules/siswa/lokasi_pkl/controllers/lokasi_pkl_controller.dart';
import 'package:simon_pkl/app/routes/app_pages.dart';
import '../../../../../material/allmaterial.dart';

class BerandaPageController extends GetxController {
  var dataPKL = Get.put(LokasiPklController());

  Future<void> ambilDataDudi() async {
    await dataPKL.fetchData();
    Get.toNamed(Routes.LOKASI_PKL);
  }

  var pageIndex = 0.obs;

  void increaseIndex() {
    pageIndex.value++;
    AllMaterial.box.write("pageIndex", pageIndex.value);
  }
}
