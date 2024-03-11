// To parse this JSON data, do
//
//     final schedules = schedulesFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Schedules> schedulesFromJson(String str) =>
    List<Schedules>.from(json.decode(str).map((x) => Schedules.fromJson(x)));

String schedulesToJson(List<Schedules> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Schedules {
  final int id;
  final String examType;
  final int categoryId;
  final String courseId;
  final String topic;
  final String meetingLink;
  final DateTime classDate;
  final DateTime date;
  final String time;
  final String additionalInformation;
  final int status;
  final DateTime updatedAt;
  final DateTime createdAt;

  Schedules({
    required this.id,
    required this.examType,
    required this.categoryId,
    required this.courseId,
    required this.topic,
    required this.meetingLink,
    required this.classDate,
    required this.date,
    required this.time,
    required this.additionalInformation,
    required this.status,
    required this.updatedAt,
    required this.createdAt,
  });

  factory Schedules.fromJson(Map<String, dynamic> json) {
    return Schedules(
      id: json["id"] ?? 0,
      examType: json["exam_type"] ?? "",
      categoryId: json["category_id"] ?? 0,
      courseId: json["course_id"] ?? "",
      topic: json["topic"] ?? "",
      meetingLink: json["meeting_link"] ?? "",
      classDate: json["class_date"] != null
          ? DateTime.parse(json["class_date"])
          : DateTime.now(),

      //classDate: DateTime.parse(json["class_date"] ?? ""),
      date: DateTime.parse(json["date"] ?? ""),
      time: json["time"] ?? "",
      additionalInformation: json["additional_information"] ?? "",
      status: json["status"] ?? 0,
      updatedAt: DateTime.parse(json["updated_at"] ?? ""),
      createdAt: DateTime.parse(json["created_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "exam_type": examType,
        "category_id": categoryId,
        "course_id": courseId,
        "topic": topic,
        "meeting_link": meetingLink,
        "class_date": classDate.toIso8601String(),
        "date": "${date.toLocal()}",
        //  "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "time": time,
        "additional_information": additionalInformation,
        "status": status,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
      };
}
