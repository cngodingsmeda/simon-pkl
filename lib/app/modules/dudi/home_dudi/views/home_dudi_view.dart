import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:simon_pkl/app/modules/dudi/data_siswa_dudi/views/data_siswa_dudi_view.dart';
import 'package:simon_pkl/app/modules/dudi/home_dudi/controllers/home_dudi_controller.dart';
import 'package:simon_pkl/app/modules/dudi/home_page_dudi/views/home_page_dudi_view.dart';
import 'package:simon_pkl/app/modules/dudi/notifikasi_dudi/views/notifikasi_dudi_view.dart';
import 'package:simon_pkl/app/modules/dudi/profile_dudi/views/profile_dudi_view.dart';
import 'package:simon_pkl/material/allmaterial.dart';

class HomeDudi extends StatefulWidget {
  const HomeDudi({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeDudiState createState() => _HomeDudiState();
}

class _HomeDudiState extends State<HomeDudi> {
  var dataDudi = HomeDudiController();

  int selectedIndex = 0;

  final PageController pageController = PageController(initialPage: 0);

  void onItemTapped(int index) async {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
    if (index == 3) {
      await dataDudi.fetchDataDudi();
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
                ? Icon(
                    MdiIcons.textBoxSearchOutline,
                    color: (selectedIndex == 1)
                        ? AllMaterial.colorBlue
                        : AllMaterial.colorGrey,
                  )
                : Icon(
                    MdiIcons.textBoxSearchOutline,
                    color: AllMaterial.colorGrey,
                  ),
            label: "Data Siswa",
            tooltip: "Data Siswa",
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
