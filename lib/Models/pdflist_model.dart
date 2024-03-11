// To parse this JSON data, do
//
//     final pdflist = pdflistFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Pdflist> pdflistFromJson(String str) =>
    List<Pdflist>.from(json.decode(str).map((x) => Pdflist.fromJson(x)));

String pdflistToJson(List<Pdflist> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pdflist {
  final int id;
  final String title;
  final String pdf;
  final int siNo;

  Pdflist({
    required this.id,
    required this.title,
    required this.pdf,
    required this.siNo,
  });

  factory Pdflist.fromJson(Map<String, dynamic> json) => Pdflist(
        id: json["id"],
        title: json["title"],
        pdf: json["pdf"],
        siNo: json["SI_NO"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "pdf": pdf,
        "SI_NO": siNo,
      };
}
