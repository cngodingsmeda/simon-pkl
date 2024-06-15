// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:iconify_flutter/icons/bxs.dart';
import 'package:simon_pkl/api/firebase_api.dart';

import 'package:simon_pkl/app/modules/siswa/beranda_page/views/beranda_page_view.dart';
import 'package:simon_pkl/app/modules/siswa/home_siswa/controllers/home_siswa_controller.dart';
import 'package:simon_pkl/app/modules/siswa/laporan_page/views/laporan_page_view.dart';
import 'package:simon_pkl/app/modules/siswa/notifikasi_page/views/notifikasi_page_view.dart';
import 'package:simon_pkl/app/modules/siswa/profile_page/views/profile_page_view.dart';
import 'package:simon_pkl/material/allmaterial.dart';

class HomeSiswa extends StatefulWidget {
  HomeSiswa({Key? key}) : super(key: key);
  @override
  _HomeSiswaState createState() => _HomeSiswaState();
}

class _HomeSiswaState extends State<HomeSiswa> {
  var dataSiswa = HomeSiswaController();
  int selectedIndex = 0;

  final PageController pageController = PageController(initialPage: 0);

  void onItemTapped(int index) async {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
    if (index == 3) {
      dataSiswa.fetchDataSiswa();
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  final FirebaseAPI fcmService = FirebaseAPI();
  @override
  Widget build(BuildContext context) {
    fcmService.init();
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        children: [
          // Beranda =======>
          BerandaPageView(),

          // Laporan =======>
          LaporanPageView(),

          // Notifikasi =======>
          NotifikasiPageView(),

          // Profil =======>
          ProfilePageView(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AllMaterial.colorWhite,
        selectedFontSize: 12,
        selectedItemColor: AllMaterial.colorBlue,
        selectedLabelStyle: const TextStyle(
          fontWeight: AllMaterial.fontSemiBold,
          fontFamily: AllMaterial.fontFamily,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: AllMaterial.fontRegular,
          fontFamily: AllMaterial.fontFamily,
        ),
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: AllMaterial.colorGrey,
        showUnselectedLabels: true,
        elevation: 5,
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: (selectedIndex == 0)
                ? Icon(Icons.home, color: AllMaterial.colorBlue)
                : const Icon(
                    Icons.home_outlined,
                  ),
            tooltip: "Beranda",
            label: "Beranda",
          ),
          BottomNavigationBarItem(
            icon: (selectedIndex == 1)
                ? Iconify(Bxs.pie_chart_alt, color: AllMaterial.colorBlue)
                : const Iconify(
                    Bx.pie_chart_alt,
                    color: AllMaterial.colorGrey,
                  ),
            label: "Laporan",
            tooltip: "Laporan",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.notifications,
              color: AllMaterial.colorBlue,
            ),
            icon: const Icon(
              Icons.notifications_outlined,
            ),
            label: "Notifikasi",
            tooltip: "Notifikasi",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.person,
              color: AllMaterial.colorBlue,
            ),
            icon: const Icon(
              Icons.person_outlined,
            ),
            label: "Profil",
            tooltip: "Profil",
          ),
        ],
      ),
    );
  }
}
