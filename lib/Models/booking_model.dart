import 'package:meta/meta.dart';
import 'dart:convert';

class BookingData {
  final String bookingNo;
  final int userId;
  final String bookingStatus;
  final int totalPrice;
  final String currency;
  final String courseName;
  final int productType;
  final String courseImage;
  final DateTime date;

  BookingData({
    required this.bookingNo,
    required this.userId,
    required this.bookingStatus,
    required this.totalPrice,
    required this.currency,
    required this.courseName,
    required this.productType,
    required this.courseImage,
    required this.date,
  });

  factory BookingData.fromJson(Map<String, dynamic> json) {
    return BookingData(
      bookingNo: json["booking_no"] ?? "",
      userId: json["user_id"] ?? 0,
      bookingStatus: json["booking_status"] ?? "",
      totalPrice: json["total_price"] ?? 0,
      currency: json["currency"] ?? "",
      courseName: json["course_name"] ?? "",
      productType: json["product_type"] ?? 0,
      courseImage: json["course_image"] ?? "",
      date: DateTime.parse(json["date"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "booking_no": bookingNo,
        "user_id": userId,
        "booking_status": bookingStatus,
        "total_price": totalPrice,
        "currency": currency,
        "course_name": courseName,
        "product_type": productType,
        "course_image": courseImage,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
      };
}

List<BookingData> bookingDataFromJson(String str) {
  final List<dynamic> jsonData = json.decode(str);
  return jsonData.map((dynamic data) => BookingData.fromJson(data)).toList();
}
