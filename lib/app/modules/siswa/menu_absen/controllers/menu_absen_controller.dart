import 'package:get/get.dart';
import 'package:simon_pkl/material/allmaterial.dart';

class MenuAbsenController extends GetxController {
  var isAbsenMasuk = false.obs;
  var isAbsenTelat = false.obs;
  var isAbsenKeluar = false.obs;
  var isAbsenDiLuarRadius = false.obs;
  RxBool cekJenisAbsenMasuk() {
    var dataJenisAbsen = AllMaterial.box.read("jenisAbsen");
    print("dataJenisAbsen: $dataJenisAbsen");
    if (dataJenisAbsen == "absen masuk") {
      print("jenisAbsen == absen masuk");
      isAbsenMasuk.value = true;
      return true.obs;
    } else if (dataJenisAbsen == "absen telat") {
      print("jenisAbsen == absen telat");
      isAbsenTelat.value = true;
      return true.obs;
    } else if (dataJenisAbsen == "absen diluar radius") {
      print("jenisAbsen == absen diluar radius");
      isAbsenDiLuarRadius.value = true;
      return true.obs;
    } else if (dataJenisAbsen == "absen keluar") {
      isAbsenKeluar.value = true;
      return true.obs;
    } else if (dataJenisAbsen == null) {
      print("null di kondisi else if");
      return false.obs;
    } else {
      print("null bg");
      return false.obs;
    }
  }
}
