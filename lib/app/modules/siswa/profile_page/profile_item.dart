// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:simon_pkl/app/models/user_model_data.dart';

// import 'package:simon_pkl/app/models/user_model.dart';
import 'package:simon_pkl/app/modules/siswa/profile_page/controllers/profile_page_controller.dart';
import 'package:simon_pkl/material/material.dart';
import 'package:string_capitalize/string_capitalize.dart';

class ProfileItem extends GetView<ProfilePageController> {
  ProfileItem({
    super.key,
  });
  final box = GetStorage();

  var dataSiswa = AllMaterial.box.read("dataSiswa");

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: AllMaterial.colorGrey,
            border: Border.all(width: 4, color: AllMaterial.colorBlue),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 2,
                offset: Offset(2, 3),
              ),
            ],
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            image: const DecorationImage(
              image: AssetImage("assets/logo/foto-profile.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                '${dataSiswa["nama"]}'.capitalizeEach(),
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: AllMaterial.fontFamily,
                  fontWeight: AllMaterial.fontBold,
                ),
              ),
            ),
            Text(
              'NISN : ${dataSiswa["nis"]}',
              style: TextStyle(
                fontSize: 12,
                fontFamily: AllMaterial.fontFamily,
                fontWeight: AllMaterial.fontSemiBold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
