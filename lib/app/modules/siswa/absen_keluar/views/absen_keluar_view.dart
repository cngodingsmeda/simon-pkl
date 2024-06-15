import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/absen_keluar_controller.dart';

class AbsenKeluarView extends GetView<AbsenKeluarController> {
  const AbsenKeluarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AbsenKeluarView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AbsenKeluarView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
