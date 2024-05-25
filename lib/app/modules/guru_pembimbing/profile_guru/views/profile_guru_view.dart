import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_guru_controller.dart';

class ProfileGuruView extends GetView<ProfileGuruController> {
  const ProfileGuruView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileGuruView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProfileGuruView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
