import 'package:meta/meta.dart';
import 'dart:convert';

class ExamDetails {
  final int id;
  final int examType;
  final String examName;
  final String shortDescription;
  final String description;
  final String image;
  final DateTime date;

  ExamDetails({
    required this.id,
    required this.examType,
    required this.examName,
    required this.shortDescription,
    required this.description,
    required this.image,
    required this.date,
  });

  factory ExamDetails.fromJson(Map<String, dynamic> json) {
    return ExamDetails(
      id: json["id"] ?? 0,
      examType: json["exam_type"] ?? 0,
      examName: json["exam_name"] ?? '',
      shortDescription: json["short_description"] ?? '',
      description: json["description"] ?? '',
      image: json["image"] ?? '',
      date:
          json["date"] != null ? DateTime.parse(json["date"]) : DateTime.now(),
    );
  }
}
