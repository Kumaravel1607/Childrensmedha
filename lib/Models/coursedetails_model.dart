// To parse this JSON data, do
//
//     final categoryDetails = categoryDetailsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CategoryDetails categoryDetailsFromJson(String str) =>
    CategoryDetails.fromJson(json.decode(str));

String categoryDetailsToJson(CategoryDetails data) =>
    json.encode(data.toJson());

class CategoryDetails {
  final Category category;
  final List<Course> course;
  final List<Topic> topic;

  CategoryDetails({
    required this.category,
    required this.course,
    required this.topic,
  });

  factory CategoryDetails.fromJson(Map<String, dynamic> json) =>
      CategoryDetails(
        category: Category.fromJson(json["category"]),
        course:
            List<Course>.from(json["course"].map((x) => Course.fromJson(x))),
        topic: List<Topic>.from(json["topic"].map((x) => Topic.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category": category.toJson(),
        "course": List<dynamic>.from(course.map((x) => x.toJson())),
        "topic": List<dynamic>.from(topic.map((x) => x.toJson())),
      };
}

class Category {
  final int id;
  final int categoryType;
  final String categoryImage;
  final String categoryName;
  final String categoryDescription;
  final String categoryFullDescription;
  final int price;
  final int oldPrice;
  final int isMutiple;
  final int validityDays;

  Category({
    required this.id,
    required this.categoryType,
    required this.categoryImage,
    required this.categoryName,
    required this.categoryDescription,
    required this.categoryFullDescription,
    required this.price,
    required this.oldPrice,
    required this.isMutiple,
    required this.validityDays,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        categoryType: json["category_type"],
        categoryImage: json["category_image"],
        categoryName: json["category_name"],
        categoryDescription: json["category_description"],
        categoryFullDescription: json["category_full_description"],
        price: json["price"],
        oldPrice: json["old_price"],
        isMutiple: json["is_mutiple"],
        validityDays: json["validity_days"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_type": categoryType,
        "category_image": categoryImage,
        "category_name": categoryName,
        "category_description": categoryDescription,
        "category_full_description": categoryFullDescription,
        "price": price,
        "old_price": oldPrice,
        "is_mutiple": isMutiple,
        "validity_days": validityDays,
      };
}

class Course {
  final int id;
  final String categoryId;
  final String courseName;
  final String courseImage;
  final dynamic price;
  final dynamic oldPrice;
  final String description;
  final String fullDescription;
  final String duration;
  final String language;
  final String liveSession;
  final int topicCount;
  final int totalHoursRecordings;
  final int recordingCount;
  final int materialCount;
  final int practiceTestCount;
  final int grandTestChapter;
  final int grandTestCombine;
  final int grandTestSyllabus;
  final String validity;

  Course({
    required this.id,
    required this.categoryId,
    required this.courseName,
    required this.courseImage,
    required this.price,
    required this.oldPrice,
    required this.description,
    required this.fullDescription,
    required this.duration,
    required this.language,
    required this.liveSession,
    required this.topicCount,
    required this.totalHoursRecordings,
    required this.recordingCount,
    required this.materialCount,
    required this.practiceTestCount,
    required this.grandTestChapter,
    required this.grandTestCombine,
    required this.grandTestSyllabus,
    required this.validity,
  });

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["id"],
        categoryId: json["category_id"],
        courseName: json["course_name"],
        courseImage: json["course_image"],
        price: json["price"],
        oldPrice: json["old_price"],
        description: json["description"],
        fullDescription: json["full_description"],
        duration: json["duration"],
        language: json["language"],
        liveSession: json["live_session"],
        topicCount: json["topic_count"],
        totalHoursRecordings: json["total_hours_recordings"],
        recordingCount: json["recording_count"],
        materialCount: json["material_count"],
        practiceTestCount: json["practice_test_count"],
        grandTestChapter: json["grand_test_chapter"],
        grandTestCombine: json["grand_test_combine"],
        grandTestSyllabus: json["grand_test_syllabus"],
        validity: json["validity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "course_name": courseName,
        "course_image": courseImage,
        "price": price,
        "old_price": oldPrice,
        "description": description,
        "full_description": fullDescription,
        "duration": duration,
        "language": language,
        "live_session": liveSession,
        "topic_count": topicCount,
        "total_hours_recordings": totalHoursRecordings,
        "recording_count": recordingCount,
        "material_count": materialCount,
        "practice_test_count": practiceTestCount,
        "grand_test_chapter": grandTestChapter,
        "grand_test_combine": grandTestCombine,
        "grand_test_syllabus": grandTestSyllabus,
        "validity": validity,
      };
}

class Topic {
  final int id;
  final String topicName;
  final int courseId;
  final int siNo;

  Topic({
    required this.id,
    required this.topicName,
    required this.courseId,
    required this.siNo,
  });

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
        id: json["id"] ?? 0,
        topicName: json["topic_name"] ?? '',
        courseId: json["course_id"] ?? 0,
        siNo: json["SI_NO"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "topic": topicName,
        "course_id": courseId,
        "SI_NO": siNo,
      };
}
