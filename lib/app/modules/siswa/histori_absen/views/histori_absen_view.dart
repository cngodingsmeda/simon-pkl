import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simon_pkl/material/allmaterial.dart';

import '../controllers/histori_absen_controller.dart';

class HistoriAbsenView extends GetView<HistoriAbsenController> {
  const HistoriAbsenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        title: const Text('Histori Absen'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: DataTable(
          border: TableBorder.symmetric(),
          headingTextStyle: TextStyle(
              color: AllMaterial.colorWhite,
              fontWeight: AllMaterial.fontSemiBold),
          columnSpacing: 28,
          headingRowColor: WidgetStatePropertyAll(AllMaterial.colorBlue),
          showBottomBorder: true,
          columns: [
            DataColumn(
              label: Text('No.'),
            ),
            DataColumn(
              label: Text('Tanggal'),
            ),
            DataColumn(
              label: Text('Masuk'),
            ),
            DataColumn(
              label: Text('Keluar'),
            ),
            DataColumn(
              label: Text('Status'),
            ),
          ],
          rows: [
            DataRow(
              onLongPress: () {
                Get.bottomSheet(Container(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  width: Get.width,
                  height: 100,
                  decoration: BoxDecoration(
                    color: AllMaterial.colorWhite,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 10),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.back();
                              // controller.pickImageFromGallery();
                            },
                            icon: Icon(
                              Icons.photo,
                              size: 35,
                            ),
                            color: AllMaterial.colorGrey,
                          ),
                          Text("From Gallery"),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.back();
                              // controller.pickImageFromCamera();
                            },
                            icon: Icon(
                              Icons.camera_alt,
                              size: 35,
                            ),
                            color: AllMaterial.colorGrey,
                          ),
                          Text("From Camera"),
                        ],
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ));
              },
              
              cells: [
                DataCell(Text('1')),
                DataCell(Text('30 Mar 2024')),
                DataCell(Text('07:11:46')),
                DataCell(Text('07:11:46')),
                DataCell(Text('Tuntas')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
