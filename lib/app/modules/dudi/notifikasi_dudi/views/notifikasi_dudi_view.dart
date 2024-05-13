import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/notifikasi_dudi_controller.dart';

class NotifikasiDudiView extends GetView<NotifikasiDudiController> {
  const NotifikasiDudiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NotifikasiDudiView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NotifikasiDudiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
