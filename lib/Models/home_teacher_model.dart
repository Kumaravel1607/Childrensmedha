// To parse this JSON data, do
//
//     final homeTeacher = homeTeacherFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<HomeTeacher> homeTeacherFromJson(String str) => List<HomeTeacher>.from(
    json.decode(str).map((x) => HomeTeacher.fromJson(x)));

String homeTeacherToJson(List<HomeTeacher> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomeTeacher {
  final int id;
  final int instructorType;
  final String instructorImage;
  final String instructorName;
  final String subject;

  HomeTeacher({
    required this.id,
    required this.instructorType,
    required this.instructorImage,
    required this.instructorName,
    required this.subject,
  });

  factory HomeTeacher.fromJson(Map<String, dynamic> json) => HomeTeacher(
        id: json["id"],
        instructorType: json["instructor_type"],
        instructorImage: json["instructor_image"],
        instructorName: json["instructor_name"],
        subject: json["subject"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "instructor_type": instructorType,
        "instructor_image": instructorImage,
        "instructor_name": instructorName,
        "subject": subject,
      };
}
