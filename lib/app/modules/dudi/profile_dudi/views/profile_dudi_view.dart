// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simon_pkl/app/modules/login/controllers/login_controller.dart';
import 'package:simon_pkl/app/modules/siswa/profile_page/profile_item_widget.dart';
import 'package:simon_pkl/material/allmaterial.dart';
import 'package:string_capitalize/string_capitalize.dart';

import '../controllers/profile_dudi_controller.dart';

class ProfileDudiView extends GetView<ProfileDudiController> {
  var auth = LoginController();
  var dataDudi = AllMaterial.box.read("dataDudi");
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
                      image: AssetImage("assets/logo/logo-simon-var2.png"),
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
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 15,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: AllMaterial.colorGrey,
                          border: Border.all(
                              width: 4, color: AllMaterial.colorBlue),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 2,
                              offset: Offset(2, 3),
                            ),
                          ],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                          image: const DecorationImage(
                            image: AssetImage("assets/logo/foto-profile.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              '${dataDudi["nama"]}'.capitalizeEach(),
                              // "afwfw",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: AllMaterial.fontFamily,
                                fontWeight: AllMaterial.fontBold,
                              ),
                            ),
                          ),
                          Text(
                            'Instansi : ${dataDudi["dudi"]["nama_instansi_perusahaan"]}'
                                .capitalizeEach(),
                            // "afwa",
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: AllMaterial.fontFamily,
                              fontWeight: AllMaterial.fontSemiBold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    height: 2,
                  ),
                  ProfileItemWidget(
                    title: "Username",
                    subTitle: "${dataDudi["username"]}",
                    // subTitle: "{dataSiswa[jurusan][nama]}",
                  ),
                  const Divider(
                    height: 2,
                  ),
                  ProfileItemWidget(
                    title: "Agama",
                    subTitle: "${dataDudi["agama"]}",
                    // subTitle: "{dataSiswa[kelas][nama]}",
                  ),
                  const Divider(
                    height: 2,
                  ),
                  ProfileItemWidget(
                    title: "Alamat",
                    subTitle:
                        "${dataDudi["alamat"]["detail_tempat"]}, ${dataDudi["alamat"]["desa"]}, ${dataDudi["alamat"]["kecamatan"]}, ${dataDudi["alamat"]["kabupaten"]}, ${dataDudi["alamat"]["provinsi"]}, ${dataDudi["alamat"]["negara"]}",
                    // "{dataSiswa[alamat][kecamatan]}, {dataSiswa[alamat][negara]}",
                  ),
                  const Divider(
                    height: 2,
                  ),
                  ProfileItemWidget(
                      title: "Jenis Kelamin",
                      subTitle:
                          // "${dataDudi["jenis_kelamin"].toString().contains('laki') ? 'Laki-Laki' : dataDudi["jenis_kelamin"]}",
                          "${dataDudi["jenis_kelamin"]}"
                      // "{dataSiswa[jenis_kelamin",
                      ),
                  const Divider(
                    height: 2,
                  ),
                  ProfileItemWidget(
                    title: "No Telepon",
                    subTitle: "${dataDudi["no_telepon"]}",
                    // subTitle: "af",
                  ),
                  const Divider(
                    height: 2,
                  ),
                  // ProfileItemWidget(
                  //   title: "Bidang",
                  //   subTitle: "${dataDudi["dudi"]["bidang"]}",
                  //   // subTitle: "af",
                  // ),
                  // const Divider(
                  //   height: 2,
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

