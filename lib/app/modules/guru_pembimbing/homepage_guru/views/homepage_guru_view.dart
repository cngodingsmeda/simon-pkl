import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simon_pkl/material/material.dart';

import '../controllers/homepage_guru_controller.dart';

class HomepageGuruView extends GetView<HomepageGuruController> {
  const HomepageGuruView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomepageGuruView'),
        centerTitle: true,
      ),
      body: Center(
        child: TextButton(
          child: Text(
            'HomepageGuruView is working',
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () => AllMaterial.box.remove("token"),
        ),
      ),
    );
  }
}
