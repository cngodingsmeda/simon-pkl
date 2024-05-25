import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/notifikasi_guru_controller.dart';

class NotifikasiGuruView extends GetView<NotifikasiGuruController> {
  const NotifikasiGuruView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NotifikasiGuruView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NotifikasiGuruView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
