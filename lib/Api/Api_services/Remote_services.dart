import 'dart:convert';

import 'package:cmedha/Api/Api.dart';
import 'package:cmedha/Models/Competitive_model.dart';
import 'package:cmedha/Models/Terms_model.dart';
import 'package:cmedha/Models/addcart_model.dart';
import 'package:cmedha/Models/banner_model.dart';
import 'package:cmedha/Models/faq_model.dart';
import 'package:cmedha/Models/home_cat_model.dart';
import 'package:cmedha/Models/home_course.dart';
import 'package:cmedha/Models/home_teacher_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  static Future<List<Faq>> faqdata() async {
    SharedPreferences session = await SharedPreferences.getInstance();

    List<Faq> users = [];

    Map data = {};
    print('-----xxx----');
    // print(data);
    var url = faq;

    var urlparse = Uri.parse(url);

    final response = await http.get(
      urlparse,
    );
    print(urlparse);

    // list = DatumResponse(response.body);

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      print(responseBody);
      users = FaqResponse(jsonEncode(responseBody['result']));

      // print(list);
      return users;
    } else {
      print(response.statusCode);
      throw Exception("Problem in fetching ");
    }
    // return list;
  }

  static List<Faq> FaqResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Faq>((json) => Faq.fromJson(json)).toList();
  }

  static Future<List<HomeCategory>> HomeCategorydata() async {
    SharedPreferences session = await SharedPreferences.getInstance();

    List<HomeCategory> users = [];

    Map data = {};
    print('-----xxx----');
    // print(data);
    var url = category;

    var urlparse = Uri.parse(url);

    final response = await http.get(
      urlparse,
    );
    print(urlparse);

    // list = DatumResponse(response.body);

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      print(responseBody);
      users = HomeCategoryResponse(jsonEncode(responseBody['category']));

      // print(list);
      return users;
    } else {
      print(response.statusCode);
      throw Exception("Problem in fetching ");
    }
    // return list;
  }

  static List<HomeCategory> HomeCategoryResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<HomeCategory>((json) => HomeCategory.fromJson(json))
        .toList();
  }

  static Future<List<HomeCourse>> HomeCoursedata() async {
    SharedPreferences session = await SharedPreferences.getInstance();

    List<HomeCourse> users = [];

    Map data = {};
    print('-----xxx----');
    // print(data);
    var url = course;

    var urlparse = Uri.parse(url);

    final response = await http.get(
      urlparse,
    );
    print(urlparse);

    // list = DatumResponse(response.body);

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      print(responseBody);
      users = HomeCourseResponse(jsonEncode(responseBody['course']));

      // print(list);
      return users;
    } else {
      print(response.statusCode);
      throw Exception("Problem in fetching ");
    }
    // return list;
  }

  static List<HomeCourse> HomeCourseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<HomeCourse>((json) => HomeCourse.fromJson(json)).toList();
  }

  static Future<List<HomeTeacher>> HomeTeacherdata() async {
    SharedPreferences session = await SharedPreferences.getInstance();

    List<HomeTeacher> user = [];

    Map data = {};
    print('-----xxx----');
    // print(data);
    var url = teacher;

    var urlparse = Uri.parse(url);

    final response = await http.get(
      urlparse,
    );
    print(urlparse);

    // list = DatumResponse(response.body);

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      print(responseBody);
      user = HomeTeacherResponse(jsonEncode(responseBody['teacher']));

      // print(list);
      return user;
    } else {
      print(response.statusCode);
      throw Exception("Problem in fetching ");
    }
    // return list;
  }

  static List<HomeTeacher> HomeTeacherResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<HomeTeacher>((json) => HomeTeacher.fromJson(json))
        .toList();
  }

  static Future<List<CompetitiveExam>> CompetitiveExamData() async {
    SharedPreferences session = await SharedPreferences.getInstance();
    List<CompetitiveExam> exams = [];

    try {
      var url = exam;
      var urlparse = Uri.parse(url);

      final response = await http.get(
        urlparse,
      );
      print(urlparse);

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        exams = competitiveExamResponse(jsonEncode(responseBody['result']));
        return exams;
      } else {
        print('Failed to fetch data. Status code: ${response.statusCode}');
        throw Exception('Problem in fetching data');
      }
    } catch (error) {
      print('Error: $error');
      throw Exception('Problem in fetching data');
    }
  }

  static List<CompetitiveExam> competitiveExamResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<CompetitiveExam>((json) => CompetitiveExam.fromJson(json))
        .toList();
  }

  static Future<List<Banner>> bannerdata() async {
    SharedPreferences session = await SharedPreferences.getInstance();
    List<Banner> banners = [];

    try {
      var url = banner; // Replace with your API endpoint
      var urlparse = Uri.parse(url);

      final response = await http.get(
        urlparse,
      );
      print(urlparse);

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        banners = BannerResponse(responseBody['result']);
        return banners;
      } else {
        print('Failed to fetch data. Status code: ${response.statusCode}');
        throw Exception('Problem in fetching data');
      }
    } catch (error) {
      print('Error: $error');
      throw Exception('Problem in fetching data');
    }
  }

  static List<Banner> BannerResponse(List<dynamic> responseBody) {
    return responseBody.map<Banner>((json) => Banner.fromJson(json)).toList();
  }

  static Future<List<AddCart>> addcart() async {
    SharedPreferences session = await SharedPreferences.getInstance();
    List<AddCart> user = [];
    var id = session.getInt('user_id');
    var url = add_cart; // Assuming terms is a valid URL
    print(url);
    var data = {
      'user_id': id.toString(),
    };
    print(data);

    var body = json.encode(data);
    var urlparse = Uri.parse(url);
    var response = await http.post(urlparse, body: body, headers: {
      "Content-Type": "application/json",
      "accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    });
    // list = DatumResponse(response.body);
    final responseBody = json.decode(response.body);
    print(responseBody);
    if (response.statusCode == 200) {
      user = AddCartResponse(jsonEncode(responseBody['cart']));

      // print(list);
      return user;
    } else {
      print(response.statusCode);
      throw Exception("Problem in fetching ");
    }
    // return list;
  }

  static List<AddCart> AddCartResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<AddCart>((json) => AddCart.fromJson(json)).toList();
  }

  static Future<List<Terms>> TermsData() async {
    SharedPreferences session = await SharedPreferences.getInstance();
    List<Terms> data = [];

    try {
      var url = terms;
      var urlparse = Uri.parse(url);

      final response = await http.get(
        urlparse,
      );
      print(urlparse);

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        data = TermsResponse(jsonEncode(responseBody['result']));
        return data;
      } else {
        print('Failed to fetch data. Status code: ${response.statusCode}');
        throw Exception('Problem in fetching data');
      }
    } catch (error) {
      print('Error: $error');
      throw Exception('Problem in fetching data');
    }
  }

  static List<Terms> TermsResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Terms>((json) => Terms.fromJson(json)).toList();
  }
}
