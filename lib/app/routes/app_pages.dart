import 'package:get/get.dart';

import '../modules/dudi/data_siswa_dudi/bindings/data_siswa_dudi_binding.dart';
import '../modules/dudi/data_siswa_dudi/views/data_siswa_dudi_view.dart';
import '../modules/dudi/home_dudi/bindings/home_dudi_binding.dart';
import '../modules/dudi/home_dudi/views/home_dudi_view.dart';
import '../modules/dudi/home_page_dudi/bindings/home_page_dudi_binding.dart';
import '../modules/dudi/home_page_dudi/views/home_page_dudi_view.dart';
import '../modules/dudi/notifikasi_dudi/bindings/notifikasi_dudi_binding.dart';
import '../modules/dudi/notifikasi_dudi/views/notifikasi_dudi_view.dart';
import '../modules/dudi/profile_dudi/bindings/profile_dudi_binding.dart';
import '../modules/dudi/profile_dudi/views/profile_dudi_view.dart';
import '../modules/guru_pembimbing/home_guru/bindings/home_guru_binding.dart';
import '../modules/guru_pembimbing/home_guru/views/home_guru_view.dart';
import '../modules/guru_pembimbing/homepage_guru/bindings/homepage_guru_binding.dart';
import '../modules/guru_pembimbing/homepage_guru/views/homepage_guru_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/siswa/ajuan_pkl/bindings/ajuan_pkl_binding.dart';
import '../modules/siswa/ajuan_pkl/views/ajuan_pkl_view.dart';
import '../modules/siswa/beranda_page/bindings/beranda_page_binding.dart';
import '../modules/siswa/beranda_page/views/beranda_page_view.dart';
import '../modules/siswa/home_siswa/bindings/home_siswa_binding.dart';
import '../modules/siswa/home_siswa/views/home_siswa_view.dart';
import '../modules/siswa/laporan_page/bindings/laporan_page_binding.dart';
import '../modules/siswa/laporan_page/views/laporan_page_view.dart';
import '../modules/siswa/lokasi_pkl/bindings/lokasi_pkl_binding.dart';
import '../modules/siswa/lokasi_pkl/views/lokasi_pkl_view.dart';
import '../modules/siswa/notifikasi_page/bindings/notifikasi_page_binding.dart';
import '../modules/siswa/notifikasi_page/views/notifikasi_page_view.dart';
import '../modules/siswa/profile_page/bindings/profile_page_binding.dart';
import '../modules/siswa/profile_page/views/profile_page_view.dart';
import '../modules/snapshot/bindings/snapshot_binding.dart';
import '../modules/snapshot/views/snapshot_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.SISWA,
      page: () => HomeSiswa(),
      binding: HomeSiswaBinding(),
    ),
    GetPage(
      name: _Paths.SNAPSHOT,
      page: () => const SnapshotView(),
      binding: SnapshotBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginSiswaBinding(),
    ),
    GetPage(
      name: _Paths.LAPORAN_PAGE,
      page: () => const LaporanPageView(),
      binding: LaporanPageBinding(),
    ),
    GetPage(
      name: _Paths.BERANDA_PAGE,
      page: () => BerandaPageView(),
      binding: BerandaPageBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFIKASI_PAGE,
      page: () => NotifikasiPageView(),
      binding: NotifikasiPageBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_PAGE,
      page: () => ProfilePageView(),
      binding: ProfilePageBinding(),
    ),
    GetPage(
      name: _Paths.LOKASI_PKL,
      page: () => LokasiPklView(),
      binding: LokasiPklBinding(),
    ),
    GetPage(
      name: _Paths.HOME_DUDI,
      page: () => const HomeDudi(),
      binding: HomeDudiBinding(),
    ),
    GetPage(
      name: _Paths.HOME_GURU,
      page: () => const HomeGuruView(),
      binding: HomeGuruBinding(),
    ),
    GetPage(
      name: _Paths.HOMEPAGE_GURU,
      page: () => const HomepageGuruView(),
      binding: HomepageGuruBinding(),
    ),
    GetPage(
      name: _Paths.HOME_PAGE_DUDI,
      page: () => HomePageDudiView(),
      binding: HomePageDudiBinding(),
    ),
    GetPage(
      name: _Paths.AJUAN_PKL,
      page: () => AjuanPklView(),
      binding: AjuanPklBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFIKASI_DUDI,
      page: () => NotifikasiDudiView(),
      binding: NotifikasiDudiBinding(),
    ),
    GetPage(
      name: _Paths.DATA_SISWA_DUDI,
      page: () => const DataSiswaDudiView(),
      binding: DataSiswaDudiBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_DUDI,
      page: () => ProfileDudiView(),
      binding: ProfileDudiBinding(),
    ),
  ];
}
