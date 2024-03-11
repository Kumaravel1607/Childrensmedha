// To parse this JSON data, do
//
//     final addCart = addCartFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<AddCart> addCartFromJson(String str) =>
    List<AddCart>.from(json.decode(str).map((x) => AddCart.fromJson(x)));

String addCartToJson(List<AddCart> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AddCart {
  final String image;
  final String name;
  final int price;
  final int cartId;

  AddCart({
    required this.image,
    required this.name,
    required this.price,
    required this.cartId,
  });

  factory AddCart.fromJson(Map<String, dynamic> json) => AddCart(
        image: json["image"],
        name: json["name"],
        price: json["price"],
        cartId: json["cart_id"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "name": name,
        "price": price,
        "cart_id": cartId,
      };
}
