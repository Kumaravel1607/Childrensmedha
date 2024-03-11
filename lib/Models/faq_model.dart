// To parse this JSON data, do
//
//     final faq = faqFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Faq> faqFromJson(String str) =>
    List<Faq>.from(json.decode(str).map((x) => Faq.fromJson(x)));

String faqToJson(List<Faq> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Faq {
  final String faqTitle;
  final String faqDescription;

  Faq({
    required this.faqTitle,
    required this.faqDescription,
  });

  factory Faq.fromJson(Map<String, dynamic> json) => Faq(
        faqTitle: json["faq_title"],
        faqDescription: json["faq_description"],
      );

  Map<String, dynamic> toJson() => {
        "faq_title": faqTitle,
        "faq_description": faqDescription,
      };
}
