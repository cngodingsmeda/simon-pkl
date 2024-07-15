import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/material/allmaterial.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

// ignore: must_be_immutable
class NotifikasiItem extends StatelessWidget {
  void Function()? onTapFunc;
  String contextTitle;
  String subTitle;
  var contextImage = "".obs;

  NotifikasiItem({
    super.key,
    required this.onTapFunc,
    required this.contextTitle,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    if (contextTitle.contains("kabar baik untukmu")) {
      contextImage.value = "assets/logo/accept.png";
    } else if (contextTitle.contains("menunggu proses...")) {
      contextImage.value = "assets/logo/pending.png";
    } else if (contextTitle.contains("sayang sekali...")) {
      contextImage.value = "assets/logo/decline.png";
    }
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onTapFunc,
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AllMaterial.colorGreySec,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Colors.black26.withOpacity(.15),
                  offset: const Offset(2, 2),
                ),
              ],
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.only(
                top: 8,
                bottom: 8,
                right: 15,
                left: 15,
              ),
              leading: Obx(
                () => Image(
                  width: 40,
                  image: AssetImage(
                    contextImage.toString(),
                  ),
                  fit: BoxFit.contain,
                ),
              ),
              title: Text(
                toBeginningOfSentenceCase(contextTitle),
                style: const TextStyle(
                  fontSize: 12,
                  fontFamily: AllMaterial.fontFamily,
                  fontWeight: AllMaterial.fontRegular,
                  color: AllMaterial.colorGrey,
                ),
              ),
              subtitle: Text(
                toBeginningOfSentenceCase(subTitle),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 15,
                  fontFamily: AllMaterial.fontFamily,
                  fontWeight: AllMaterial.fontBold,
                  color: AllMaterial.colorBlack,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
