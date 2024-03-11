import 'package:meta/meta.dart';
import 'dart:convert';

List<CompetitiveExam> competitiveExamFromJson(String str) =>
    List<CompetitiveExam>.from(
        json.decode(str).map((x) => CompetitiveExam.fromJson(x)));

String competitiveExamToJson(List<CompetitiveExam> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CompetitiveExam {
  final int id;
  final int examType;
  final String examName;
  final String imageName;
  final String slug;
  final String shortDescription;
  final String image;
  final DateTime date;

  CompetitiveExam({
    required this.id,
    required this.examType,
    required this.examName,
    required this.imageName,
    required this.slug,
    required this.shortDescription,
    required this.image,
    required this.date,
  });

  factory CompetitiveExam.fromJson(Map<String, dynamic> json) =>
      CompetitiveExam(
        id: json["id"] ?? 0,
        examType: json["exam_type"] ?? 0,
        examName: json["exam_name"] ?? '',
        imageName: json["image_name"] ?? '',
        slug: json["slug"] ?? '',
        shortDescription: json["short_description"] ?? '',
        image: json["image"] ?? '',
        date: DateTime.parse(json["date"] ?? ''),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "exam_type": examType,
        "exam_name": examName,
        "image_name": imageName,
        "slug": slug,
        "short_description": shortDescription,
        "image": image,
        "date": "${date.toLocal()}",
      };
}
