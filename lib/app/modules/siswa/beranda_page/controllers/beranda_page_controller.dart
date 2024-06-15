import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/app/modules/login/controllers/login_controller.dart';
import 'package:simon_pkl/app/modules/siswa/ajuan_pkl/views/ajuan_pkl_view.dart';
import 'package:simon_pkl/app/modules/siswa/beranda_page/views/beranda_page_view.dart';
import 'package:simon_pkl/app/modules/siswa/home_siswa/controllers/home_siswa_controller.dart';
import 'package:simon_pkl/app/modules/siswa/lokasi_pkl/controllers/lokasi_pkl_controller.dart';
import 'package:simon_pkl/app/modules/siswa/menu_absen/views/menu_absen_view.dart';
import 'package:simon_pkl/app/routes/app_pages.dart';
import 'package:http/http.dart' as http;
import 'package:string_capitalize/string_capitalize.dart';
import '../../../../../material/allmaterial.dart';

class BerandaPageController extends GetxController {
  var findStatusSiswaUrl = "http://10.0.2.2:2008/siswa/findPengajuanPending";
  var cancelPKLUrl = "http://10.0.2.2:2008/siswa/cancelPengajuanPkl";
  var controllerHomeSiswa = HomeSiswaController();
  Future<void> cancelPKL(int idAjuanPKL) async {
    var tokenLogin = AllMaterial.box.read("token");
    try {
      var response = await http.post(
        headers: {
          "Authorization": "Bearer $tokenLogin",
        },
        body: {
          "id": "$idAjuanPKL",
        },
        Uri.parse(
          cancelPKLUrl,
        ),
      );
      print("response status di cancel pkl: ${response.statusCode}");
      print("response di cancel pkl: ${response.body}");
      if (response.statusCode == 200) {
        BerandaPageView.indexWidget.value = "belum_pkl";
        AllMaterial.box.remove("selectedData");
      }
    } catch (e) {
      print("error di cancel PKL: $e");
    }
  }

  @override
  void onReady() {
    controllerHomeSiswa.fetchDataSiswa();
    super.onReady();
  }

  @override
  void onInit() async {
    Get.put(LoginController());
    await findStatusSiswa();
    super.onInit();
  }

  Future<void> ambilDataDudi() async {
    var dataPKL = Get.put(LokasiPklController());
    await dataPKL.fetchData();
    Get.toNamed(Routes.LOKASI_PKL);
  }

  Future<void> findStatusSiswa() async {
    var _tokenLogin = AllMaterial.box.read("token");

    var response = await http.get(
      headers: {"Authorization": "Bearer $_tokenLogin"},
      Uri.parse(findStatusSiswaUrl),
    );
    var data = jsonDecode(response.body);
    if (response.statusCode == 200 && data["data"] != null) {
      AllMaterial.box.write("statusPKLSiswa", data["data"]);
      AllMaterial.box.write("idAjuanPKLSiswa", data["id"]);
      var dataStatusSiswa = data["data"]["status"];
      print("status pkl: ${dataStatusSiswa}");
      if (dataStatusSiswa.toString().contains("belum_pkl")) {
        BerandaPageView.indexWidget.value = "belum_pkl";
      } else if (dataStatusSiswa.toString().contains("proses")) {
        BerandaPageView.indexWidget.value = "proses";
      } else if (dataStatusSiswa.toString().contains("pkl")) {
        BerandaPageView.indexWidget.value = "pkl";
      }
    }
  }
}

var controller = Get.put(BerandaPageController());
var dataSiswa = AllMaterial.box.read("dataLoginSiswa");
var dudiTerpilih = AllMaterial.box.read("dudiTerpilih");
var dataNisSiswa = dataSiswa["nis"];

class HomePageNol extends StatelessWidget {
  HomePageNol({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        surfaceTintColor: AllMaterial.colorWhite,
        backgroundColor: AllMaterial.colorWhite,
        leading: Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            width: 25,
            height: 25,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/logo/logo-simon-var2.png"),
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: IconButton(
              onPressed: () {
                controller.ambilDataDudi();
              },
              icon: const Icon(Icons.add_outlined),
              color: Colors.white,
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  AllMaterial.colorBlue,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Text(
          "Belum ada data nih...\nKlik + untuk memilih instansi",
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: AllMaterial.fontFamily),
        ),
      ),
    );
  }
}

class HomePageSatu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    controller.findStatusSiswa();
    var dataAjuanPKLSiswa = AllMaterial.box.read("statusPKLSiswa");

    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      body: SingleChildScrollView(
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Selamat Datang, Siswa",
                              style: TextStyle(
                                fontFamily: AllMaterial.fontFamily,
                                fontSize: 18,
                                color: AllMaterial.colorWhite,
                                fontWeight: AllMaterial.fontBold,
                              ),
                            ),
                            Text(
                              "NISN : ${dataNisSiswa}",
                              style: TextStyle(
                                fontFamily: AllMaterial.fontFamily,
                                fontSize: 15,
                                color: AllMaterial.colorWhite,
                                fontWeight: AllMaterial.fontRegular,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            Get.toNamed(Routes.AJUAN_PKL);
                          },
                          icon: const Icon(Icons.history),
                          color: AllMaterial.colorBlue,
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              AllMaterial.colorWhite,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            dataAjuanPKLSiswa != null
                ? Container(
                    margin: EdgeInsets.only(top: 130),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: Get.width,
                            margin: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AllMaterial.colorWhite,
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(34, 63, 63, 63),
                                  offset: Offset(5, 5),
                                  blurRadius: 25,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Container(
                                    width: Get.width,
                                    margin: EdgeInsets.all(10),
                                    child: Text(
                                      "Ajuan Saya :",
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: AllMaterial.fontFamily,
                                        fontWeight: AllMaterial.fontSemiBold,
                                        color: AllMaterial.colorBlack,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        ListTile(
                                          contentPadding: EdgeInsets.symmetric(
                                            vertical: 0,
                                            horizontal: 15,
                                          ),
                                          title: Text(
                                            "Instansi Dipilih :",
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontFamily:
                                                  AllMaterial.fontFamily,
                                            ),
                                          ),
                                          subtitle: Text(
                                            "${dataAjuanPKLSiswa["dudi"]["nama_instansi_perusahaan"]}"
                                                .capitalizeEach(),
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily:
                                                  AllMaterial.fontFamily,
                                              fontWeight: AllMaterial.fontBold,
                                            ),
                                          ),
                                        ),
                                        ListTile(
                                          contentPadding: EdgeInsets.symmetric(
                                            vertical: 0,
                                            horizontal: 15,
                                          ),
                                          title: Text(
                                            "No. Telpon Instansi :",
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontFamily:
                                                  AllMaterial.fontFamily,
                                            ),
                                          ),
                                          subtitle: Text(
                                            "${dataAjuanPKLSiswa["dudi"]["no_telepon"] ?? ""}",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily:
                                                  AllMaterial.fontFamily,
                                              fontWeight: AllMaterial.fontBold,
                                            ),
                                          ),
                                        ),
                                        ListTile(
                                          contentPadding: EdgeInsets.symmetric(
                                            vertical: 0,
                                            horizontal: 15,
                                          ),
                                          title: Text(
                                            "Alamat Instansi :",
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontFamily:
                                                  AllMaterial.fontFamily,
                                            ),
                                          ),
                                          subtitle: Text(
                                            "${dataAjuanPKLSiswa["dudi"]["alamat"]["detail_tempat"] ?? ""}, ${dataAjuanPKLSiswa["dudi"]["alamat"]["desa"] ?? ""}, ${dataAjuanPKLSiswa["dudi"]["alamat"]["kecamatan"] ?? ""}, ${dataAjuanPKLSiswa["dudi"]["alamat"]["kabupaten"] ?? ""}, ${dataAjuanPKLSiswa["dudi"]["alamat"]["provinsi"] ?? ""}"
                                                .capitalizeEach(),
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily:
                                                  AllMaterial.fontFamily,
                                              fontWeight: AllMaterial.fontBold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          fixedSize: Size.fromWidth(150),
                                          surfaceTintColor:
                                              AllMaterial.colorWhite,
                                          backgroundColor:
                                              AllMaterial.colorWhite,
                                          foregroundColor:
                                              AllMaterial.colorWhite,
                                          shadowColor: AllMaterial.colorWhite,
                                          elevation: 0,
                                          side: BorderSide(
                                            color: AllMaterial.colorRed,
                                            width: 1,
                                          ),
                                        ),
                                        onPressed: () {
                                          Get.defaultDialog(
                                            middleTextStyle: TextStyle(
                                              fontFamily:
                                                  AllMaterial.fontFamily,
                                            ),
                                            backgroundColor:
                                                AllMaterial.colorWhite,
                                            radius: 10,
                                            buttonColor: AllMaterial.colorBlue,
                                            titleStyle: TextStyle(
                                                fontWeight:
                                                    AllMaterial.fontMedium),
                                            title: "Konfirmasi",
                                            middleText:
                                                "Apakah Anda yakin ingin membatalkan PKL di ${dataAjuanPKLSiswa["dudi"]["nama_instansi_perusahaan"].toString().capitalizeEach()}?",
                                            onConfirm: () {
                                              Get.back();
                                              controller.cancelPKL(
                                                  dataAjuanPKLSiswa["id"]);
                                            },
                                            barrierDismissible: true,
                                            textCancel: "Batalkan",
                                            textConfirm: "Konfirmasi",
                                          );
                                        },
                                        child: Text(
                                          "Batalkan",
                                          style: TextStyle(
                                            fontFamily: AllMaterial.fontFamily,
                                            color: AllMaterial.colorRed,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          fixedSize: Size.fromWidth(150),
                                          surfaceTintColor:
                                              AllMaterial.colorWhite,
                                          backgroundColor:
                                              AllMaterial.colorWhite,
                                          foregroundColor:
                                              AllMaterial.colorWhite,
                                          shadowColor: AllMaterial.colorWhite,
                                          elevation: 0,
                                          side: BorderSide(
                                            color: AllMaterial.colorGreen,
                                            width: 1,
                                          ),
                                        ),
                                        onPressed: () {
                                          Get.toNamed(Routes.AJUAN_PKL);
                                        },
                                        child: Text(
                                          "Cek Status",
                                          style: TextStyle(
                                            fontFamily: AllMaterial.fontFamily,
                                            color: AllMaterial.colorGreen,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}

class HomePageDua extends StatelessWidget {
  const HomePageDua({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      body: SingleChildScrollView(
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Selamat Datang, Siswa",
                              style: TextStyle(
                                fontFamily: AllMaterial.fontFamily,
                                fontSize: 18,
                                color: AllMaterial.colorWhite,
                                fontWeight: AllMaterial.fontBold,
                              ),
                            ),
                            Text(
                              "NISN : ${dataSiswa["nis"]}".capitalizeEach(),
                              style: TextStyle(
                                fontFamily: AllMaterial.fontFamily,
                                fontSize: 15,
                                color: AllMaterial.colorWhite,
                                fontWeight: AllMaterial.fontRegular,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 90,
              ),
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    opacity: .5,
                    image: AssetImage(
                      "assets/logo/computer.png",
                    ),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: Get.height * 0.33,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 27),
                  child: Container(
                    height: 55,
                    width: Get.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Status Absen Hari Ini : ",
                          style: TextStyle(
                            fontFamily: AllMaterial.fontFamily,
                            fontWeight: AllMaterial.fontBold,
                            fontSize: 15,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              Text(
                                "Belum",
                                style: TextStyle(
                                  fontWeight: AllMaterial.fontSemiBold,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.close,
                                color: AllMaterial.colorRed,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
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
                  ),
                ),
                SelectNavigatorSiswa(
                  icon: Icon(
                    Icons.watch_later_outlined,
                    size: 80,
                    color: AllMaterial.colorWhite,
                  ),
                  nama: "Mulai Absen",
                  onTap: () => Get.to(() => MenuAbsenView()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class SelectNavigatorSiswa extends StatelessWidget {
  Icon icon;
  String nama;
  void Function()? onTap;
  bool? active = false;

  SelectNavigatorSiswa({
    required this.icon,
    required this.nama,
    required this.onTap,
    this.active,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      child: (active == false)
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