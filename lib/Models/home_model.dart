// To parse this JSON data, do
//
//     final home = homeFromJson(jsonString);

import 'dart:convert';

import 'package:cmedha/Navi_Screen/Course.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

List<List<dynamic>> homeFromJson(String str) => List<List<dynamic>>.from(
    json.decode(str).map((x) => List<dynamic>.from(x.map((x) => x))));

String homeToJson(List<List<dynamic>> data) => json.encode(
    List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x)))));

class HomeElement {
  List<HomeCategory>? category;
  List<HomeCourse>? course;
  List<HomeTeacher>? teacher;
  // final int id;
  // final String categoryName;
  // final String image;
  // final String categoryId;
  // final String courseImage;
  // final String courseName;
  // final int instructorType;
  // final String instructorImage;
  // final String instructorName;

  HomeElement({
    this.teacher,
    this.category,
    this.course,
  });

  HomeElement.fromJson(Map<String, dynamic> json) {
    if (json['category'] != null) {
      category = <HomeCategory>[];
      json['category'].forEach((v) {
        category!.add(HomeCategory.fromJson(v));
      });
    }
    if (json['course'] != null) {
      course = <HomeCourse>[];
      json['course'].forEach((v) {
        course!.add(HomeCourse.fromJson(v));
      });
    }
    if (json['teacher'] != null) {
      teacher = <HomeTeacher>[];
      json['teacher'].forEach((v) {
        teacher!.add(HomeTeacher.fromJson(v));
      });
    }
  }
}

class HomeCategory {
  final int id;
  final String categoryName;
  final String image;

  HomeCategory({
    required this.id,
    required this.categoryName,
    required this.image,
  });

  factory HomeCategory.fromJson(Map<String, dynamic> json) => HomeCategory(
        id: json["id"],
        categoryName: json["category_name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
        "image": image,
      };
}

class HomeCourse {
  final int id;
  final String categoryId;
  final String courseImage;
  final String courseName;

  HomeCourse({
    required this.id,
    required this.categoryId,
    required this.courseImage,
    required this.courseName,
  });

  factory HomeCourse.fromJson(Map<String, dynamic> json) => HomeCourse(
        id: json["id"],
        categoryId: json["category_id"],
        courseImage: json["course_image"],
        courseName: json["course_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "course_image": courseImage,
        "course_name": courseName,
      };
}

class HomeTeacher {
  final int id;
  final int instructorType;
  final String instructorImage;
  final String instructorName;
  final String about;
  final String subject;
  final String skills;
  final String email;
  final String phone;
  final int status;
  final DateTime createdAt;
  final DateTime updatedAt;

  HomeTeacher({
    required this.id,
    required this.instructorType,
    required this.instructorImage,
    required this.instructorName,
    required this.about,
    required this.subject,
    required this.skills,
    required this.email,
    required this.phone,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory HomeTeacher.fromJson(Map<String, dynamic> json) => HomeTeacher(
        id: json["id"],
        instructorType: json["instructor_type"],
        instructorImage: json["instructor_image"],
        instructorName: json["instructor_name"],
        about: json["about"],
        subject: json["subject"],
        skills: json["skills"],
        email: json["email"],
        phone: json["phone"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "instructor_type": instructorType,
        "instructor_image": instructorImage,
        "instructor_name": instructorName,
        "about": about,
        "subject": subject,
        "skills": skills,
        "email": email,
        "phone": phone,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
