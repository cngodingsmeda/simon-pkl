import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../../material/material.dart';

class SnapshotView extends GetView<SnapshotController> {
  const SnapshotView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllMaterial.colorBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logo/logo-simon-var1.png",
              alignment: Alignment.center,
              height: 100,
              width: 100,
            ),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "Simon",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: AllMaterial.fontRegular,
                      fontFamily: "Montserrat",
                    ),
                  ),
                  TextSpan(
                    text: "PKL",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: AllMaterial.fontBold,
                      fontFamily: AllMaterial.fontFamily,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
