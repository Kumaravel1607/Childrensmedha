import 'package:meta/meta.dart';
import 'dart:convert';

Terms termsFromJson(String str) => Terms.fromJson(json.decode(str));

String termsToJson(Terms data) => json.encode(data.toJson());

class Terms {
  final int id;
  final String title;
  final String fullDescription;
  final DateTime updatedAt;
  final DateTime createdAt;

  Terms({
    required this.id,
    required this.title,
    required this.fullDescription,
    required this.updatedAt,
    required this.createdAt,
  });

  factory Terms.fromJson(Map<String, dynamic> json) {
    return Terms(
      id: json["id"] as int,
      title: json["title"] as String,
      fullDescription: json["full_description"] as String,
      updatedAt: DateTime.parse(json["updated_at"] as String),
      createdAt: DateTime.parse(json["created_at"] as String),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "full_description": fullDescription,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
      };
}
