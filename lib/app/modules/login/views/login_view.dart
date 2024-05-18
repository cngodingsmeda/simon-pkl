// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simon_pkl/material/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../controllers/login_controller.dart';

var loginC = Get.put(LoginController());

class LoginView extends GetView<LoginController> {
  LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Selamat Datang!",
                style: TextStyle(
                  fontSize: 26,
                  fontFamily: AllMaterial.fontFamily,
                  fontWeight: AllMaterial.fontSemiBold,
                  color: AllMaterial.colorBlack,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "Silahkan masukkan data Anda",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: AllMaterial.fontFamily,
                  fontWeight: AllMaterial.fontSemiBold,
                  color: AllMaterial.colorBlack,
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: controller.textBodyC,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  focusColor: AllMaterial.colorBlue,
                  hoverColor: AllMaterial.colorBlue,
                  fillColor: AllMaterial.colorBlue,
                  contentPadding: EdgeInsets.all(10),
                  labelText: "NISN/NIP/Username",
                  labelStyle: TextStyle(
                      fontFamily: AllMaterial.fontFamily,
                      fontSize: 14,
                      color: AllMaterial.colorBlack),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AllMaterial.colorBlue,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AllMaterial.colorBlue,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: controller.pwC,
                autocorrect: false,
                cursorColor: AllMaterial.colorBlue,
                obscureText: (controller.isObsecure.isTrue) ? true : false,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.isObsecure.value =
                          !controller.isObsecure.value;
                    },
                    icon: (controller.isObsecure.isTrue)
                        ? Icon(
                            Icons.remove_red_eye_rounded,
                            color: AllMaterial.colorGrey,
                          )
                        : Icon(
                            MdiIcons.eyeOff,
                            color: AllMaterial.colorGrey,
                          ),
                  ),
                  focusColor: AllMaterial.colorBlue,
                  hoverColor: AllMaterial.colorBlue,
                  fillColor: AllMaterial.colorBlue,
                  contentPadding: const EdgeInsets.all(10),
                  labelText: 'Password',
                  labelStyle: const TextStyle(
                    color: AllMaterial.colorBlack,
                    fontFamily: AllMaterial.fontFamily,
                    fontSize: 14,
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AllMaterial.colorBlue,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AllMaterial.colorBlue,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(
                    Size(Get.width, 50),
                  ),
                  backgroundColor: MaterialStatePropertyAll(
                    AllMaterial.colorBlue,
                  ),
                ),
                onPressed: () {
                  controller.login();
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: AllMaterial.fontFamily,
                    fontWeight: AllMaterial.fontSemiBold,
                    color: AllMaterial.colorWhite,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
