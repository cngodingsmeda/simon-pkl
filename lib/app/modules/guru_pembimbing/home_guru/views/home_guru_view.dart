import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simon_pkl/material/material.dart';

import '../controllers/home_guru_controller.dart';

class HomeGuruView extends GetView<HomeGuruController> {
  const HomeGuruView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeGuruView'),
        centerTitle: true,
      ),
      body:  Center(
        child: TextButton(
          child: Text(
            '<== Balik',
            style: TextStyle(fontSize: 25),
          ),
          onPressed: () => AllMaterial.box.remove("token"),
        ),
      ),
    );
  }
}
