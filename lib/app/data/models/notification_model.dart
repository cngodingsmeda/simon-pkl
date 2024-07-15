// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) => json.encode(data.toJson());

class NotificationModel {
    int? id;
    int? idSiswa;
    int? idGuruPembimbing;
    int? idPembimbingDudi;
    String? judul;
    String? isi;
    List<dynamic>? read;

    NotificationModel({
        this.id,
        this.idSiswa,
        this.idGuruPembimbing,
        this.idPembimbingDudi,
        this.judul,
        this.isi,
        this.read,
    });

    factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
        id: json["id"],
        idSiswa: json["id_siswa"],
        idGuruPembimbing: json["id_guru_pembimbing"],
        idPembimbingDudi: json["id_pembimbing_dudi"],
        judul: json["judul"],
        isi: json["isi"],
        read: List<dynamic>.from(json["read"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "id_siswa": idSiswa,
        "id_guru_pembimbing": idGuruPembimbing,
        "id_pembimbing_dudi": idPembimbingDudi,
        "judul": judul,
        "isi": isi,
        "read": List<dynamic>.from(read!.map((x) => x)),
    };
}
