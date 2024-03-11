// To parse this JSON data, do
//
//     final topic = topicFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:meta/meta.dart';
import 'dart:convert';

List<Topic> topicFromJson(String str) {
  List<dynamic> jsonData = json.decode(str) ?? [];
  return jsonData.map((x) => Topic.fromJson(x)).toList();
}

String topicToJson(List<Topic> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Topic {
  final int id;
  final String topic;
  final int siNo;

  Topic({
    required this.id,
    required this.topic,
    required this.siNo,
  });

  factory Topic.fromJson(Map<String, dynamic> json) {
    return Topic(
      id: json["id"] ?? 0,
      topic: json["topic"] ?? '',
      siNo: json["SI_NO"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "topic": topic,
        "SI_NO": siNo,
      };
}
