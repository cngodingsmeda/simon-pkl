import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:simon_pkl/material/material.dart';

class AjuanPklController extends GetxController {
  @override
  void onInit() {
    AllMaterial.box.remove("dataPrevDudi");
    super.onInit();
  }

  DateTime now = DateTime.now();
  late DateTime futureDate;
  late DateFormat formatter;
  late String formattedDate;

  AjuanPklController() {
    futureDate = now.add(Duration(days: 3));
    formatter = DateFormat.yMMMMd('id');
    formattedDate = formatter.format(futureDate);
  }
}
