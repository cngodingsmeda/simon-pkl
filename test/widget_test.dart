// // Column(
//           // children: [
//             // Expanded(
//               // child: dataPrevDudi.isNotEmpty
//                   // ? ListView.builder(
//                       // itemCount: dataPrevDudi.length,
//                       // itemBuilder: (context, index) => FutureBuilder(
//                         // future: controller.fetchData(),
//                         // builder: (context, snapshot) {
//                           // if (snapshot.connectionState ==
//                               // ConnectionState.waiting) {
//                             // return Center(
//                               // child: SizedBox(),
//                             // );
//                           // } else {
//                             // return ExpansionTile(
//                               // initiallyExpanded: false,
//                               // tilePadding:
//                                   // const EdgeInsets.symmetric(horizontal: 5),
//                               // controlAffinity: ListTileControlAffinity.leading,
//                               // title: Row(/
//                                 // children: [
//                                   // Expanded(
//                                     // child: SizedBox(
//                                       // child: FittedBox(
//                                         // fit: BoxFit.scaleDown,
//                                         // alignment: Alignment.centerLeft,
//                                         // child: Text(
//                                           // "${dataPrevDudi[index]["nama_instansi_perusahaan"]}"
//                                               // .capitalizeEach(),
//                                           // overflow: TextOverflow.ellipsis,
//                                           // maxLines: 1,
//                                           // style: const TextStyle(
//                                             // fontSize: 15,
//                                             // fontFamily: AllMaterial.fontFamily,
//                                             // color: AllMaterial.colorBlack,
//                                             // fontWeight: FontWeight/.bold,
//                                           // ),
//                                         // ),
//                                       // ),
//                                     // ),
//                                   // ),
//                                   // FittedBox(
//                                     // fit: BoxFit.scaleDown,
//                                     // child: Text(
//                                       // (dataPrevD/udi[index]["total_siswa"] !=
//                                               // null)
//                                           // ? "Siswa PKL: ${dataPrevDudi[index]["total_siswa"]}"
//                                           // : "Siswa PKL: 0",
//                                       // overflow: TextOverflow.ellipsis,
//                                       // maxLines: 1,
//                                     // ),
//                                   // ),/
//                                 // ],
//                               // ),
//                               // children: [
//                                 ListTile(
//                                   leading: const Text(
//                                     "Tahun :",
//                                     style: TextStyle(
//                                       color: AllMaterial.colorBlack,
//                                       fontWeight: AllMaterial.fontMedium,
//                                       fontFamily: AllMaterial.fontFamily,
//                                     ),
//                                   ),
//                                   title: Text(
//                                     "2024",
//                                     style: const TextStyle(
//                                       fontFamily: AllMaterial.fontFamily,
//                                     ),
//                                   ),
//                                 ),
//                                 ListTile(
//                                   leading: const Text(
//                                     "No. Telpon :",
//                                     style: TextStyle(
//                                       color: AllMaterial.colorBlack,
//                                       fontWeight: AllMaterial.fontMedium,
//                                       fontFamily: AllMaterial.fontFamily,
//                                     ),
//                                   ),
//                                   title: Text(
//                                     "${dataPrevDudi[index]["no_telepon"]}",
//                                     style: const TextStyle(
//                                       fontFamily: AllMaterial.fontFamily,
//                                     ),
//                                   ),
//                                 ),
//                                 ListTile(
//                                   leading: const Text(
//                                     "Bidang :",
//                                     style: TextStyle(
//                                       color: AllMaterial.colorBlack,
//                                       fontWeight: AllMaterial.fontMedium,
//                                       fontFamily: AllMaterial.fontFamily,
//                                     ),
//                                   ),
//                                   title: Text(
//                                     "${dataPrevDudi[index]["bidang"]}"
//                                         .capitalizeEach(),
//                                     style: const TextStyle(
//                                       fontFamily: AllMaterial.fontFamily,
//                                     ),
//                                   ),
//                                 ),
//                                 ListTile(
//                                   leading: const Text(
//                                     "Alamat :",
//                                     style: TextStyle(
//                                       color: AllMaterial.colorBlack,
//                                       fontWeight: AllMaterial.fontMedium,
//                                       fontFamily: AllMaterial.fontFamily,
//                                     ),
//                                   ),
//                                   title: Text(
//                                     "${dataPrevDudi[index]["detail_tempat"]}, ${dataPrevDudi[index]["desa"]}, ${dataPrevDudi[index]["kecamatan"]}, ${dataPrevDudi[index]["kabupaten"]}, ${dataPrevDudi[index]["provinsi"]}"
//                                         .capitalizeEach(),
//                                     style: const TextStyle(
//                                       fontFamily: AllMaterial.fontFamily,
//                                     ),
//                                   ),
//                                 ),
//                                 ListTile(
//                                   leading: const Text(
//                                     "Deskripsi :",
//                                     style: TextStyle(
//                                       color: AllMaterial.colorBlack,
//                                       fontWeight: AllMaterial.fontMedium,
//                                       fontFamily: AllMaterial.fontFamily,
//                                     ),
//                                   ),
//                                   title: Text(
//                                     toBeginningOfSentenceCase(
//                                         "${dataPrevDudi[index]["deksripsi"]}"),
//                                     style: const TextStyle(
//                                       fontFamily: AllMaterial.fontFamily,
//                                     ),
//                                   ),
//                                 ),
//                                 ListTile(
//                                   leading: const Text(
//                                     "Kuota :",
//                                     style: TextStyle(
//                                       color: AllMaterial.colorBlack,
//                                       fontWeight: AllMaterial.fontMedium,
//                                       fontFamily: AllMaterial.fontFamily,
//                                     ),
//                                   ),
//                                   title: Column(
//                                     children: [
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           const Text(
//                                             "Laki-Laki",
//                                             style: TextStyle(
//                                               fontFamily:
//                                                   AllMaterial.fontFamily,
//                                               fontWeight:
//                                                   AllMaterial.fontSemiBold,
//                                               color: AllMaterial.colorBlack,
//                                             ),
//                                           ),
//                                           Container(
//                                             padding: const EdgeInsets.all(5),
//                                             decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(5),
//                                               color: AllMaterial.colorGreySec,
//                                             ),
//                                             margin:
//                                                 const EdgeInsets.only(left: 10),
//                                             child: RichText(
//                                               text: TextSpan(
//                                                 text: (dataPrevDudi[index][
//                                                             "total_siswa_laki"] !=
//                                                         null)
//                                                     ? "${dataPrevDudi[index]["total_siswa_laki"]}"
//                                                     : "0",
//                                                 style: TextStyle(
//                                                   fontFamily:
//                                                       AllMaterial.fontFamily,
//                                                   fontWeight:
//                                                       AllMaterial.fontSemiBold,
//                                                   color: AllMaterial.colorBlack,
//                                                 ),
//                                                 children: [
//                                                   TextSpan(
//                                                     text: " / ",
//                                                     style: TextStyle(
//                                                       fontFamily: AllMaterial
//                                                           .fontFamily,
//                                                       fontWeight: AllMaterial
//                                                           .fontSemiBold,
//                                                       color: AllMaterial
//                                                           .colorBlack,
//                                                     ),
//                                                   ),
//                                                   TextSpan(
//                                                     text: (dataPrevDudi[index][
//                                                                 "kouta_laki"] !=
//                                                             null)
//                                                         ? "${dataPrevDudi[index]["kouta_laki"]}"
//                                                         : "0",
//                                                     style: TextStyle(
//                                                       fontFamily: AllMaterial
//                                                           .fontFamily,
//                                                       fontWeight: AllMaterial
//                                                           .fontSemiBold,
//                                                       color: AllMaterial
//                                                           .colorBlack,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           const Text(
//                                             "Perempuan",
//                                             style: TextStyle(
//                                               fontFamily:
//                                                   AllMaterial.fontFamily,
//                                               fontWeight:
//                                                   AllMaterial.fontSemiBold,
//                                               color: AllMaterial.colorBlack,
//                                             ),
//                                           ),
//                                           Container(
//                                             padding: const EdgeInsets.all(5),
//                                             decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(5),
//                                               color: AllMaterial.colorGreySec,
//                                             ),
//                                             margin:
//                                                 const EdgeInsets.only(left: 10),
//                                             child: RichText(
//                                               text: TextSpan(
//                                                 text: (dataPrevDudi[index][
//                                                             "total_siswa_perempuan"] !=
//                                                         null)
//                                                     ? "${dataPrevDudi[index]["total_siswa_perempuan"]}"
//                                                     : "0",
//                                                 style: TextStyle(
//                                                   fontFamily:
//                                                       AllMaterial.fontFamily,
//                                                   fontWeight:
//                                                       AllMaterial.fontSemiBold,
//                                                   color: AllMaterial.colorBlack,
//                                                 ),
//                                                 children: [
//                                                   TextSpan(
//                                                     text: " / ",
//                                                     style: TextStyle(
//                                                       fontFamily: AllMaterial
//                                                           .fontFamily,
//                                                       fontWeight: AllMaterial
//                                                           .fontSemiBold,
//                                                       color: AllMaterial
//                                                           .colorBlack,
//                                                     ),
//                                                   ),
//                                                   TextSpan(
//                                                     text: (dataPrevDudi[index][
//                                                                 "kouta_perempuan"] !=
//                                                             null)
//                                                         ? "${dataPrevDudi[index]["kouta_perempuan"]}"
//                                                         : "0",
//                                                     style: TextStyle(
//                                                       fontFamily: AllMaterial
//                                                           .fontFamily,
//                                                       fontWeight: AllMaterial
//                                                           .fontSemiBold,
//                                                       color: AllMaterial
//                                                           .colorBlack,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 const SizedBox(height: 10),
//                                 (dataPrevDudi[index]["enabled"]
//                                         .toString()
//                                         .contains("true"))
//                                     ? GestureDetector(
//                                         onTap: () {
//                                           Get.defaultDialog(
//                                             middleTextStyle: TextStyle(
//                                               fontFamily:
//                                                   AllMaterial.fontFamily,
//                                             ),
//                                             backgroundColor:
//                                                 AllMaterial.colorWhite,
//                                             radius: 10,
//                                             buttonColor: AllMaterial.colorBlue,
//                                             titleStyle: TextStyle(
//                                                 fontWeight:
//                                                     AllMaterial.fontMedium),
//                                             title: "Konfirmasi",
//                                             middleText:
//                                                 "Apakah Anda yakin ingin mengajukan PKL di ${dataPrevDudi[index]["nama_instansi_perusahaan"].toString().capitalizeEach()}?",
//                                             onConfirm: () {
//                                               Get.back();
//                                               Get.offAllNamed(
//                                                 Routes.AJUAN_PKL,
//                                                 arguments:
//                                                     AllMaterial.box.write(
//                                                   "selectedData",
//                                                   dataPrevDudi[index],
//                                                 ),
//                                               );
//                                             },
//                                             barrierDismissible: false,
//                                             textCancel: "Batalkan",
//                                             textConfirm: "Konfirmasi",
//                                           );
//                                         },
//                                         child: Container(
//                                           margin: const EdgeInsets.symmetric(
//                                               horizontal: 10),
//                                           decoration: BoxDecoration(
//                                             color: AllMaterial.colorBlue,
//                                             borderRadius:
//                                                 BorderRadius.circular(20),
//                                           ),
//                                           width: Get.width,
//                                           height: 45,
//                                           child: Center(
//                                             child: Text(
//                                               "Ajukan PKL",
//                                               style: TextStyle(
//                                                 fontFamily:
//                                                     AllMaterial.fontFamily,
//                                                 fontWeight:
//                                                     AllMaterial.fontSemiBold,
//                                                 color: AllMaterial.colorWhite,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       )
//                                     : Container(
//                                         margin: const EdgeInsets.symmetric(
//                                             horizontal: 10),
//                                         decoration: BoxDecoration(
//                                           color: AllMaterial.colorGreySec,
//                                           borderRadius:
//                                               BorderRadius.circular(20),
//                                         ),
//                                         width: Get.width,
//                                         height: 45,
//                                         child: Center(
//                                           child: Text(
//                                             "Ajukan PKL",
//                                             style: TextStyle(
//                                               fontFamily:
//                                                   AllMaterial.fontFamily,
//                                               fontWeight:
//                                                   AllMaterial.fontSemiBold,
//                                               color: AllMaterial.colorGrey,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                 const SizedBox(height: 10),
//                               ],
//                             );
//                           }
//                         },
//                       ),
//                     )
//                   : Center(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           CircularProgressIndicator(
//                             color: AllMaterial.colorBlue,
//                           ),
//                           SizedBox(
//                             height: 15,
//                           ),
//                           Text(
//                             "Harap Tunggu Sebentar...",
//                             style: TextStyle(
//                               fontFamily: AllMaterial.fontFamily,
//                               fontSize: 18,
//                               fontWeight: AllMaterial.fontMedium,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//             ),
//             Container(
//               height: 65,
//               color: AllMaterial.colorWhite,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: dataCountPage,
//                   itemBuilder: (context, index) => Obx(
//                     () => GestureDetector(
//                       onTap: () async {
//                         controller.intPage.value = index;
//                         print(controller.intPage.value);
//                         await controller.fetchData();
//                       },
//                       child: Container(
//                         width: 50,
//                         alignment: Alignment.center,
//                         padding: EdgeInsets.symmetric(horizontal: 20),
//                         decoration: BoxDecoration(
//                           boxShadow: [
//                             BoxShadow()
//                           ],
//                           borderRadius: BorderRadius.circular(15),
//                           color: (controller.intPage.value == index)
//                               ? AllMaterial.colorBlue
//                               : AllMaterial.colorWhite,
//                         ),
//                         margin: EdgeInsets.symmetric(horizontal: 5),
//                         child: Text(
//                           "${index + 1}",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: AllMaterial.fontSemiBold,
//                             color: (controller.intPage.value == index)
//                                 ? AllMaterial.colorWhite
//                                 : AllMaterial.colorBlue,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         )