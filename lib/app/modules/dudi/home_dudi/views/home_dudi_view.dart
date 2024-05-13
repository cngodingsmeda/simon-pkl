import 'package:flutter/material.dart';

import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:iconify_flutter/icons/bxs.dart';
import 'package:simon_pkl/app/modules/dudi/data_siswa_dudi/views/data_siswa_dudi_view.dart';
import 'package:simon_pkl/app/modules/dudi/home_page_dudi/views/home_page_dudi_view.dart';
import 'package:simon_pkl/app/modules/dudi/notifikasi_dudi/views/notifikasi_dudi_view.dart';
import 'package:simon_pkl/app/modules/dudi/profile_dudi/views/profile_dudi_view.dart';
import 'package:simon_pkl/material/material.dart';

class HomeDudi extends StatefulWidget {
  const HomeDudi({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeDudiState createState() => _HomeDudiState();
}

class _HomeDudiState extends State<HomeDudi> {
  int selectedIndex = 0;

  final PageController pageController = PageController(initialPage: 0);

  void onItemTapped(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
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
          HomePageDudiView(),

          // Data Siswa =======>
          DataSiswaDudiView(),

          // Notifikasi =======>
          NotifikasiDudiView(),

          // Profil =======>
          ProfileDudiView(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
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
            // icon: Icon(Icons.data_saver_off_sharp),
            icon: (selectedIndex == 1)
                ? Iconify(
                    Bxs.pie_chart_alt,
                    color: (selectedIndex == 1)
                        ? AllMaterial.colorBlue
                        : AllMaterial.colorGrey,
                  )
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
