import 'package:flutter/material.dart';
import 'package:simon_pkl/material/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class NotifikasiItemDudi extends StatelessWidget {
  void Function()? onTapFunc;
  String contextTitle;
  String subTitle;
  String contextImage;

  NotifikasiItemDudi(
      {super.key,
      required this.onTapFunc,
      required this.contextTitle,
      required this.subTitle,
      required this.contextImage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          height: Get.height * 0.125,
          width: Get.width,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: onTapFunc,
            child: Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AllMaterial.colorWhite,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Colors.black26.withOpacity(.15),
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
              child: ListTile(
                // contentPadding: const EdgeInsets.only(
                //   // top: 8,
                //   bottom: 8,
                //   // right: 10,
                //   // left: 10,
                // ),
                leading: Image(
                  width: 40,
                  image: AssetImage(
                    contextImage,
                  ),
                  fit: BoxFit.contain,
                ),
                title: Text(
                  contextTitle,
                  style: const TextStyle(
                    fontSize: 12,
                    fontFamily: AllMaterial.fontFamily,
                    fontWeight: AllMaterial.fontRegular,
                    color: AllMaterial.colorGrey,
                  ),
                ),
                subtitle: Text(
                  subTitle,
                  style: const TextStyle(
                    fontSize: 15,
                    fontFamily: AllMaterial.fontFamily,
                    fontWeight: AllMaterial.fontBold,
                    color: AllMaterial.colorBlack,
                  ),
                ),
                // trailing: const Icon(
                //   Icons.arrow_forward_ios_outlined,
                // ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
