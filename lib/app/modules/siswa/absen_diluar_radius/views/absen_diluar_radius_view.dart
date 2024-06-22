import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/absen_diluar_radius_controller.dart';

class AbsenDiluarRadiusView extends GetView<AbsenDiluarRadiusController> {
  const AbsenDiluarRadiusView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AbsenDiluarRadiusView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AbsenDiluarRadiusView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
