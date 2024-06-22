import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/absen_telat_controller.dart';

class AbsenTelatView extends GetView<AbsenTelatController> {
  const AbsenTelatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AbsenTelatView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AbsenTelatView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
