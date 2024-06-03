import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/material/allmaterial.dart';

// ignore: must_be_immutable
class SelectNavigatorDudiWidget extends StatelessWidget {
  Icon icon;
  String nama;
  void Function()? onTap;
  int? jumlahSiswa;

  SelectNavigatorDudiWidget({
    required this.icon,
    required this.nama,
    required this.onTap,
    this.jumlahSiswa,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      child: (jumlahSiswa == 0)
          ? Ink(
              height: 100,
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  icon,
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    nama,
                    style: TextStyle(
                      fontWeight: AllMaterial.fontBold,
                      fontSize: 18,
                      color: AllMaterial.colorWhite,
                      fontFamily: AllMaterial.fontFamily,
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xff60AFF4),
                boxShadow: [
                  BoxShadow(
                    color: AllMaterial.colorGreySec,
                    spreadRadius: 0.2,
                    blurRadius: 8,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
            )
          : InkWell(
              onTap: onTap,
              child: Ink(
                height: 100,
                width: Get.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    icon,
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      nama,
                      style: TextStyle(
                        fontWeight: AllMaterial.fontBold,
                        fontSize: 18,
                        color: AllMaterial.colorWhite,
                        fontFamily: AllMaterial.fontFamily,
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AllMaterial.colorBlue,
                  boxShadow: [
                    BoxShadow(
                      color: AllMaterial.colorGreySec,
                      spreadRadius: 0.2,
                      blurRadius: 8,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
