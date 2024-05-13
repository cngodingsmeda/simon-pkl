// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simon_pkl/app/modules/login/controllers/login_controller.dart';
import 'package:simon_pkl/material/material.dart';

import '../controllers/profile_dudi_controller.dart';

class ProfileDudiView extends GetView<ProfileDudiController> {
  var auth = LoginController();
  ProfileDudiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
                  surfaceTintColor: AllMaterial.colorWhite,
                  snap: true,
                  floating: true,
                  backgroundColor: AllMaterial.colorWhite,
                  leadingWidth: Get.width,
                  leading: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: SizedBox(
                          width: 45,
                          height: 45,
                          child: Image(
                            image:
                                AssetImage("assets/logo/logo-simon-var2.png"),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Profil Saya",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: AllMaterial.fontFamily,
                          fontWeight: AllMaterial.fontBold,
                          color: AllMaterial.colorBlue,
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    PopupMenuButton(
                      color: AllMaterial.colorWhite,
                      surfaceTintColor: AllMaterial.colorWhite,
                      iconColor: AllMaterial.colorBlue,
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            onTap: () => AllMaterial.dialogSimon(
                              msg: "Apakah Anda ingin Logout?",
                              msgC:
                                  "Jika Anda logout, semua laporan anda saat ini tidak dapat diakses kecuali anda login kembali.",
                              onCancel: () => print("Test Batal"),
                              onConfirm: () {
                                Get.back();
                                auth.logout();
                                Get.reloadAll();
                              },
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.logout_rounded,
                                  color: Colors.red,
                                ),
                                Text(
                                  "Log out",
                                  style: TextStyle(
                                    fontFamily: AllMaterial.fontFamily,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ];
                      },
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
