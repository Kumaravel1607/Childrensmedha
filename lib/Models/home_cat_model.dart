import 'package:meta/meta.dart';
import 'dart:convert';

List<HomeCategory> homeCategoryFromJson(String str) => List<HomeCategory>.from(
    json.decode(str).map((x) => HomeCategory.fromJson(x)));

String homeCategoryToJson(List<HomeCategory> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomeCategory {
  final int id;
  final int categoryType;
  final String categoryName;
  final String image;
  final int isMutiple;
  final int categoryPrice;
  final int categoryOldPrice;

  HomeCategory({
    required this.id,
    required this.categoryType,
    required this.categoryName,
    required this.image,
    required this.isMutiple,
    required this.categoryPrice,
    required this.categoryOldPrice,
  });

  factory HomeCategory.fromJson(Map<String, dynamic> json) => HomeCategory(
        id: json["id"] ?? 0,
        categoryType: json["category_type"] ?? 0,
        categoryName: json["category_name"] ?? "",
        image: json["image"] ?? "",
        isMutiple: json["is_mutiple"] ?? 0,
        categoryPrice: json["category_price"] ?? 0,
        categoryOldPrice: json["category_old_price"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_type": categoryType,
        "category_name": categoryName,
        "image": image,
        "is_mutiple": isMutiple,
        "category_price": categoryPrice,
        "category_old_price": categoryOldPrice,
      };
}
