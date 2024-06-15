import 'dart:io';

import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AbsenMasukController extends GetxController {
  double latitudeSiswa = 0;
  double longitudeSiswa = 0;
  Rx<File> imageAbsen = Rx<File>(File(""));

  Future pickImageFromGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      } else {
        final imageSementara = File(image.path);
        imageAbsen.value = imageSementara;
        print("Image from gallery: $imageSementara");
      }
    } on PlatformException catch (e) {
      print("Gagal mengambil gambar dari gallery: $e");
    }
  }

  Future pickImageFromCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) {
        return;
      } else {
        final imageSementara = File(image.path);
        imageAbsen.value = imageSementara;
        print("Image from camera: $imageSementara");
      }
    } on PlatformException catch (e) {
      print("Gagal mengambil gambar dari kamera: $e");
    }
  }

  Future<Position> getLokasiSiswa() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error("Akses Lokasi Tidak Aktif");
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Akses Untuk Mengakses Lokasi Ditolak");
      }
    }
    return await Geolocator.getCurrentPosition();
  }
}
