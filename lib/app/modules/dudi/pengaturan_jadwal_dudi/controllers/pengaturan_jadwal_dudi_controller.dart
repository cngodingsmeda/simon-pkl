import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PengaturanJadwalDudiController extends GetxController {
  var jamMasuk = TextEditingController();
  var jamPulang = TextEditingController();

  RxList totalJadwal = [].obs;


  void tambahJadwal(Widget jadwal) {
    totalJadwal.add(jadwal);
  }
}
