// To parse this JSON data, do
//
//     final videolist = videolistFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Videolist> videolistFromJson(String str) =>
    List<Videolist>.from(json.decode(str).map((x) => Videolist.fromJson(x)));

String videolistToJson(List<Videolist> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Videolist {
  final int id;
  final String title;
  final int siNo;

  Videolist({
    required this.id,
    required this.title,
    required this.siNo,
  });

  factory Videolist.fromJson(Map<String, dynamic> json) => Videolist(
        id: json["id"],
        title: json["title"],
        siNo: json["SI_NO"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "SI_NO": siNo,
      };
}
