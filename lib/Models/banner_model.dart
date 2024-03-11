// To parse this JSON data, do
//
//     final banner = bannerFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Banner> bannerFromJson(String str) =>
    List<Banner>.from(json.decode(str).map((x) => Banner.fromJson(x)));

String bannerToJson(List<Banner> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Banner {
  final int id;
  final String bannerImage;
  final String bannerTitle;

  Banner({
    required this.id,
    required this.bannerImage,
    required this.bannerTitle,
  });

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        id: json["id"],
        bannerImage: json["banner_image"],
        bannerTitle: json["banner_title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "banner_image": bannerImage,
        "banner_title": bannerTitle,
      };
}
