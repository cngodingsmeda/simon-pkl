import 'package:get/get.dart';

class MonitoringSiswaPklController extends GetxController {
   var datesY = <DateTime>[].obs;

  void setDate(List<DateTime?> dates) {
    datesY.value = dates.whereType<DateTime>().toList();
    print(datesY);
  }
}
