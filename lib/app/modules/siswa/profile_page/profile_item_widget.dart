import 'package:flutter/material.dart';
import 'package:simon_pkl/material/material.dart';
import 'package:string_capitalize/string_capitalize.dart';

// ignore: must_be_immutable
class ProfileItemWidget extends StatelessWidget {
  String title;
  String subTitle;
  ProfileItemWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 15,
            fontFamily: AllMaterial.fontFamily,
            fontWeight: AllMaterial.fontBold,
            color: AllMaterial.colorBlack),
      ),
      subtitle: Text(
        subTitle.capitalizeEach(),
        style: const TextStyle(
          fontSize: 12,
          fontFamily: AllMaterial.fontFamily,
          fontWeight: AllMaterial.fontSemiBold,
        ),
      ),
    );
  }
}
