import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:simon_pkl/app/modules/dudi/monitoring_siswa_dudi/monitoring_siswa_widget.dart';
import 'package:simon_pkl/app/modules/siswa/ajuan_pkl/views/ajuan_pkl_view.dart';
import 'package:simon_pkl/material/allmaterial.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

import '../controllers/monitoring_siswa_pkl_controller.dart';

class MonitoringSiswaPklView extends GetView<MonitoringSiswaPklController> {
  var siswaDibimbing = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.back();
        },
        backgroundColor: AllMaterial.colorBlue,
        foregroundColor: AllMaterial.colorWhite,
        tooltip: 'Back',
        child: Icon(
          Icons.arrow_back,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      backgroundColor: AllMaterial.colorWhite,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                ClipPath(
                  clipper: ClipPathClass(),
                  child: Container(
                    height: 300,
                    width: Get.width,
                    color: AllMaterial.colorBlue,
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: context.mediaQueryPadding.top + 100,
                                left: context.mediaQueryPadding.left + 30,
                              ),
                              child: Text(
                                "Monitoring Siswa",
                                style: TextStyle(
                                  fontFamily: AllMaterial.fontFamily,
                                  fontSize: 35,
                                  fontWeight: AllMaterial.fontSemiBold,
                                  color: AllMaterial.colorWhite.withOpacity(.8),
                                ),
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.monitor,
                                size: 235,
                                color: AllMaterial.colorWhite.withOpacity(.2),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 40,
                    right: 20,
                    left: 20,
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: AllMaterial.colorWhite,
                        boxShadow: kElevationToShadow[6],
                      ),
                      child: IconButton(
                        iconSize: 25,
                        onPressed: () {
                          var dateC = Get.put(MonitoringSiswaPklController());
                          Get.bottomSheet(
                            Container(
                              width: Get.width,
                              padding: EdgeInsets.symmetric(vertical: 15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Filter Siswa",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Obx(
                                    () => CalendarDatePicker2(
                                      config: CalendarDatePicker2Config(
                                        currentDate: DateTime.now(),
                                        lastDate: DateTime.now(),
                                        firstDate: DateTime(2023),
                                        selectedDayHighlightColor:
                                            AllMaterial.colorBlue,
                                        calendarType:
                                            CalendarDatePicker2Type.single,
                                      ),
                                      value: dateC.datesY,
                                      onValueChanged: (dates) {
                                        dateC.setDate(dates);
                                        print(dates);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.filter_alt,
                          color: AllMaterial.colorBlue,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: context.mediaQueryPadding.right + 30,
                    left: context.mediaQueryPadding.left + 30,
                    top: context.mediaQueryPadding.top * 10.5,
                    bottom: context.mediaQueryPadding.bottom + 20,
                  ),
                  child: Container(
                    height: 55,
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AllMaterial.colorWhite,
                      boxShadow: [
                        BoxShadow(
                          color: AllMaterial.colorGrey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            "Siswa Yang Dibimbing: ",
                            style: TextStyle(
                              fontFamily: AllMaterial.fontFamily,
                              fontWeight: AllMaterial.fontBold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 80,
                          decoration: BoxDecoration(
                            color: AllMaterial.colorGrey.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            '$siswaDibimbing',
                            style: TextStyle(
                              fontWeight: AllMaterial.fontBold,
                              fontFamily: AllMaterial.fontFamily,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Stack(
                  children: [
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Text(
                            '${DateFormat("d MMMM yyyy - H.m", "id_ID").format(DateTime.now())}',
                            style: TextStyle(
                              color: AllMaterial.colorWhite,
                            ),
                          ),
                        ),
                        width: Get.width * .4,
                        decoration: BoxDecoration(
                          color: Colors.blue[700],
                          borderRadius: BorderRadiusDirectional.circular(5),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: siswaDibimbing,
              (context, index) => MonitoringSiswaWidget(
                nama: 'Arya Dwi Nitinegara',
                kelas: 'XII RPL 2',
                instansi: 'Bayan Tech',
                jamMasuk: DateFormat.Hms().format(DateTime.now()),
                jamPulang: DateFormat.Hms().format(DateTime.now()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
