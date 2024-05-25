import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:iconify_flutter/icons/bxs.dart';

import 'package:simon_pkl/app/modules/guru_pembimbing/homepage_guru/views/homepage_guru_view.dart';
import 'package:simon_pkl/app/modules/guru_pembimbing/laporan_pkl_siswa/views/laporan_pkl_siswa_view.dart';
import 'package:simon_pkl/app/modules/guru_pembimbing/notifikasi_guru/views/notifikasi_guru_view.dart';
import 'package:simon_pkl/app/modules/guru_pembimbing/profile_guru/views/profile_guru_view.dart';
import 'package:simon_pkl/material/material.dart';

import '../controllers/home_guru_controller.dart';

class HomeGuru extends StatefulWidget {
  const HomeGuru({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeGuruState createState() => _HomeGuruState();
}

class _HomeGuruState extends State<HomeGuru> {
  var dataGuru = HomeGuruController();

  int selectedIndex = 0;

  final PageController pageController = PageController(initialPage: 0);

  void onItemTapped(int index) async {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
    if (index == 3) {
      await dataGuru.fetchDataGuru();
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          HomepageGuruView(),

          // Data Siswa =======>
          LaporanPklSiswaView(),

          // Notifikasi =======>
          NotifikasiGuruView(),

          // Profil =======>
          ProfileGuruView(),
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
                ? Icon(
                    Icons.home,
                    color: (selectedIndex == 0)
                        ? AllMaterial.colorBlue
                        : AllMaterial.colorGrey,
                  )
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
            icon: (selectedIndex == 2)
                ? Icon(
                    Icons.notifications,
                    color: (selectedIndex == 2)
                        ? AllMaterial.colorBlue
                        : AllMaterial.colorGrey,
                  )
                : const Icon(
                    Icons.notifications_outlined,
                  ),
            label: "Notifikasi",
            tooltip: "Notifikasi",
          ),
          BottomNavigationBarItem(
            icon: (selectedIndex == 3)
                ? Icon(
                    Icons.person,
                    color: (selectedIndex == 3)
                        ? AllMaterial.colorBlue
                        : AllMaterial.colorGrey,
                  )
                : const Icon(
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
