import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/laporan_pkl_siswa_controller.dart';

class LaporanPklSiswaView extends GetView<LaporanPklSiswaController> {
  const LaporanPklSiswaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LaporanPklSiswaView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LaporanPklSiswaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
