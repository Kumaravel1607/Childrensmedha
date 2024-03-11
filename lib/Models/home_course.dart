import 'package:meta/meta.dart';
import 'dart:convert';

List<HomeCourse> homeCourseFromJson(String str) =>
    List<HomeCourse>.from(json.decode(str).map((x) => HomeCourse.fromJson(x)));

String homeCourseToJson(List<HomeCourse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomeCourse {
  final int id;
  final String categoryId;
  final String courseImage;
  final String courseName;
  final int price;
  final int oldPrice;

  HomeCourse({
    required this.id,
    required this.categoryId,
    required this.courseImage,
    required this.courseName,
    required this.price,
    required this.oldPrice,
  });

  factory HomeCourse.fromJson(Map<String, dynamic> json) => HomeCourse(
      id: json["id"] != null ? int.parse(json["id"].toString()) : 0,
      categoryId: json["category_id"] ?? '',
      courseName: json["course_name"] ?? '',
      courseImage: json["course_image"] ?? '',
      price: json["price"] != null ? int.parse(json["price"].toString()) : 0,
      oldPrice: json["old_price"] != null
          ? int.parse(json["old_price"].toString())
          : 0);

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "course_image": courseImage,
        "course_name": courseName,
        "price": price,
        "old_price": oldPrice,
      };
}
