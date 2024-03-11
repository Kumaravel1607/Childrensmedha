// import 'dart:convert';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cmedha/Api/Api.dart';
// import 'package:cmedha/screens/Constant/color.dart';
// import 'package:cmedha/screens/Payment/purchaseDetail.dart';
// import 'package:cmedha/screens/widget.dart';
// import 'package:cmedha/toast.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class CourseScreen extends StatefulWidget {
//   const CourseScreen({Key? key}) : super(key: key);

//   @override
//   State<CourseScreen> createState() => _CourseScreenState();
// }

// class _CourseScreenState extends State<CourseScreen>
//     with SingleTickerProviderStateMixin {
//   List<Map<String, dynamic>> courses = [];
//   List<Map<String, dynamic>> categories = [];
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     fetchCourseData();
//     fetchCategoryData();
//     _tabController = TabController(length: 2, vsync: this);
//   }

//   Future<void> fetchCourseData() async {
//     final response =
//         await http.get(Uri.parse('https://dreams.hashref.org/api/course'));

//     if (response.statusCode == 200) {
//       final Map<String, dynamic> data = json.decode(response.body);
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       setState(() {
//         courses = List<Map<String, dynamic>>.from(data['course']);
//         for (var course in courses) {
//           prefs.setInt('course_id_${course['id']}', course['id']);
//         }
//       });
//     } else {
//       // Handle the error
//       print('Failed to load course data: ${response.statusCode}');
//     }
//   }

//   Future<void> fetchCategoryData() async {
//     final response =
//         await http.get(Uri.parse('https://dreams.hashref.org/api/category'));

//     if (response.statusCode == 200) {
//       final Map<String, dynamic> data = json.decode(response.body);

//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       setState(() {
//         categories = List<Map<String, dynamic>>.from(data['category']);

//         for (var category in categories) {
//           prefs.setInt('category_id_${category['id']}', category['id']);
//           prefs.setInt('is_multiple_${category['id']}', category['is_mutiple']);
//         }
//       });
//     } else {
//       // Handle the error
//       print('Failed to load category data: ${response.statusCode}');
//     }
//   }

//   addcart(String? courseId, bool isMultiple) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     int userId = prefs.getInt('user_id') ?? 0;

//     //var url = 'http://192.168.29.233/laravel/childerns/api/add-to-cart';
//     var url = click_cart;
//     var urlparse = Uri.parse(url);

//     Map<String, String> data;

//     if (isMultiple) {
//       data = {
//         'category_id': courseId ?? '',
//         'user_id': userId.toString(),
//         'is_mutiple': '1',
//       };
//     } else {
//       data = {
//         'course_id': courseId ?? '',
//         'user_id': userId.toString(),
//         'is_mutiple': '0',
//       };
//     }

//     print(data);

//     var body = json.encode(data);

//     try {
//       var response = await http.post(
//         urlparse,
//         body: body,
//         headers: {
//           "Content-Type": "application/json",
//           "accept": "application/json",
//           "Access-Control-Allow-Origin": "*"
//         },
//       );

//       print(response.body);

//       if (response.statusCode == 200) {
//         final responseBody = json.decode(response.body);
//         toastInfo(mesg: responseBody['message']);
//       } else {
//         print('Error: ${response.statusCode}');
//         toastInfo(mesg: 'Failed to add to cart');
//       }
//     } catch (error) {
//       print('Error: $error');
//       toastInfo(mesg: 'Failed to add to cart');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         shadowColor: Colors.black,
//         bottom: TabBar(
//           indicatorWeight: 2,
//           indicatorPadding: EdgeInsets.zero,
//           labelPadding: EdgeInsets.zero,
//           controller: _tabController,
//           tabs: const [
//             Tab(
//               child: SizedBox(
//                 child: Center(
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 10),
//                     child: Text(
//                       'Course for Children',
//                       style:
//                           TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
//                     ),
//                   ),
//                 ),
//                 // Set flex property to 1 for equal distribution
//               ),
//             ),
//             Tab(
//               child: SizedBox(
//                 child: Center(
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 10),
//                     child: Text(
//                       'Course for Other',
//                       style:
//                           TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
//                     ),
//                   ),
//                 ),
//                 // Set flex property to 1 for equal distribution
//               ),
//             ),
//           ],
//           labelColor: white,
//           // Set the indicator weight
//           indicatorColor: white,
//           unselectedLabelColor: grey,
//         ),
//         toolbarHeight: 0,
//         elevation: 5,
//       ),
//       body: TabBarView(
//         physics: AlwaysScrollableScrollPhysics(),
//         controller: _tabController,
//         children: [
//           buildCourseTab(type: true),

//           // Course for Others Tab
//           buildCourseTab(type: false), // Course for Other
//         ],
//       ),
//     );
//   }

//   Widget buildCourseTab({required bool type}) {
//     // Your existing course tab content here
//     // Replace your existing ListView.builder with the necessary modifications
//     return ListView.builder(
//       itemCount: categories.length,
//       itemBuilder: (context, categoryIndex) {
//         final category = categories[categoryIndex];

//         final isMultiple = category['is_mutiple'] == 1;
//         final categoryType = category['category_type'];
//         if ((type && categoryType == 1) || (!type && categoryType == 2)) {
//           return SizedBox(
//             child: isMultiple
//                 ? SizedBox(
//                     width: MediaQuery.of(context).size.width,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 10, horizontal: 10),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           text20(' ${category['category_name']}', black),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Container(
//                             height: 150,
//                             child: ListView.builder(
//                               shrinkWrap: true,
//                               physics: AlwaysScrollableScrollPhysics(),
//                               scrollDirection: Axis.horizontal,
//                               itemCount: courses.length,
//                               itemBuilder: (context, courseIndex) {
//                                 final course = courses[courseIndex];

//                                 final courseId = course['category_id'];
//                                 final courseIdInt = int.tryParse(courseId);

//                                 if (courseIdInt == category['id']) {
//                                   return Row(
//                                     children: [
//                                       ClipRRect(
//                                         borderRadius: BorderRadius.only(
//                                             topLeft: Radius.circular(10),
//                                             topRight: Radius.circular(10)),
//                                         child: Column(
//                                           children: [
//                                             Container(
//                                               height: 100,
//                                               width: 160,
//                                               decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     BorderRadius.circular(5),
//                                               ),
//                                               child: CachedNetworkImage(
//                                                 imageUrl:
//                                                     course['course_image'],
//                                                 fit: BoxFit.fill,
//                                                 placeholder: (context, url) =>
//                                                     Center(
//                                                         child: SizedBox(
//                                                   height: 30,
//                                                   child: SizedBox(
//                                                     height: 25,
//                                                     width: 25,
//                                                     child:
//                                                         CircularProgressIndicator(
//                                                       valueColor:
//                                                           AlwaysStoppedAnimation<
//                                                               Color>(Blue),
//                                                       backgroundColor:
//                                                           Colors.white,
//                                                       strokeWidth: 2,
//                                                     ),
//                                                   ),
//                                                 )), // Placeholder widget while loading
//                                                 errorWidget:
//                                                     (context, url, error) =>
//                                                         Icon(Icons.error),
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               height: 10,
//                                             ),
//                                             text16(' ${course['course_name']}',
//                                                 black),
//                                           ],
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         width: 20,
//                                       ),
//                                     ],
//                                   );
//                                 } else {
//                                   return Container();
//                                 }
//                               },
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 10),
//                             child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10)),
//                                 backgroundColor: Colors.blue,
//                                 minimumSize: const Size.fromHeight(44),
//                               ),
//                               onPressed: () {
//                                 //  String courseId = courses[courseIndex]['course_id'].toString();
//                                 addcart(category['id'].toString(), true);
//                                 print(category['id'].toString());
//                                 // addcart(course['course_id'], category['category_id'], true);
//                                 // Navigator.of(context, rootNavigator: true).push(
//                                 //   MaterialPageRoute(
//                                 //     builder: (context) => PurchaseDetail(),
//                                 //   ),
//                                 // );
//                               },
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   text16(
//                                       ' ${category['category_price']}', white),
//                                   SizedBox(
//                                     width: 20,
//                                   ),
//                                   const Text(
//                                     'Add To Cart',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w700,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Divider(),
//                         ],
//                       ),
//                     ),
//                   )
//                 : SizedBox(
//                     width: MediaQuery.of(context).size.width,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 10, horizontal: 10),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           text20(' ${category['category_name']}', black),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Container(
//                             height: 200,
//                             child: ListView.builder(
//                               shrinkWrap: true,
//                               physics: AlwaysScrollableScrollPhysics(),
//                               scrollDirection: Axis.horizontal,
//                               itemCount: courses.length,
//                               itemBuilder: (context, courseIndex) {
//                                 // final course = filteredCourses[courseIndex];
//                                 final course = courses[courseIndex];
//                                 final courseId = course['category_id'];
//                                 final courseIdInt = int.tryParse(courseId);

//                                 if (courseIdInt == category['id']) {
//                                   return Row(
//                                     children: [
//                                       ClipRRect(
//                                         borderRadius: BorderRadius.only(
//                                             topLeft: Radius.circular(10),
//                                             topRight: Radius.circular(10)),
//                                         child: Column(
//                                           children: [
//                                             // Image.network(
//                                             //   course['course_image'],
//                                             //   height: 100,
//                                             //   width: 150,
//                                             // ),
//                                             Container(
//                                               height: 100,
//                                               width: 220,
//                                               decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     BorderRadius.circular(5),
//                                               ),
//                                               child: CachedNetworkImage(
//                                                 imageUrl:
//                                                     course['course_image'],
//                                                 fit: BoxFit.fill,
//                                                 placeholder: (context, url) =>
//                                                     Center(
//                                                         child: SizedBox(
//                                                             height: 25,
//                                                             width: 25,
//                                                             child:
//                                                                 CircularProgressIndicator(
//                                                               valueColor:
//                                                                   AlwaysStoppedAnimation<
//                                                                           Color>(
//                                                                       Blue),
//                                                               backgroundColor:
//                                                                   Colors.white,
//                                                               strokeWidth: 2,
//                                                             ))),

//                                                 // Placeholder widget while loading
//                                                 errorWidget:
//                                                     (context, url, error) =>
//                                                         Icon(Icons.error),
//                                               ),
//                                             ),

//                                             // Container(
//                                             //   height: 100,
//                                             //   //width: 200,
//                                             //   decoration: BoxDecoration(
//                                             //     borderRadius:
//                                             //         BorderRadius.circular(
//                                             //             5),
//                                             //     image: DecorationImage(
//                                             //       image: NetworkImage(
//                                             //           course[
//                                             //               'course_image']),
//                                             //       fit: BoxFit.fill,
//                                             //     ),
//                                             //   ),
//                                             // ),
//                                             SizedBox(
//                                               height: 10,
//                                             ),
//                                             text16(' ${course['course_name']}',
//                                                 black),
//                                             SizedBox(
//                                               height: 10,
//                                             ),
//                                             SizedBox(
//                                               width: 220,
//                                               child: ElevatedButton(
//                                                 style: ElevatedButton.styleFrom(
//                                                   shape: RoundedRectangleBorder(
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               10)),
//                                                   backgroundColor: Colors.blue,
//                                                 ),
//                                                 onPressed: () {
//                                                   addcart(
//                                                       course['id'].toString(),
//                                                       //  category['category_id'],
//                                                       false);
//                                                   print(
//                                                     course['id'].toString(),
//                                                   );
//                                                   // Handle onPressed logic
//                                                 },
//                                                 child: Row(
//                                                   children: [
//                                                     text16(
//                                                         course['price']
//                                                             .toString(),
//                                                         white),
//                                                     SizedBox(
//                                                       width: 20,
//                                                     ),
//                                                     // FaIcon(Icons.shopping_cart,
//                                                     //     color: white),
//                                                     const Text(
//                                                       'Add To Cart',
//                                                       style: TextStyle(
//                                                         color: Colors.white,
//                                                         fontSize: 16,
//                                                         fontWeight:
//                                                             FontWeight.w700,
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         width: 20,
//                                       ),
//                                     ],
//                                   );
//                                 } else {
//                                   return Container();
//                                 }
//                               },
//                             ),
//                           ),
//                           Divider(),
//                         ],
//                       ),
//                     ),
//                   ),
//           );
//         } else {
//           return Container();
//         }
//       },
//     );
//   }

//   Widget buildCourseItem(Map<String, dynamic> course) {
//     return Row(
//       children: [
//         ClipRRect(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(10),
//             topRight: Radius.circular(10),
//           ),
//           child: Column(
//             children: [
//               Container(
//                 height: 100,
//                 width: 160,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//                 child: CachedNetworkImage(
//                   imageUrl: course['course_image'],
//                   fit: BoxFit.fill,
//                   placeholder: (context, url) => Center(
//                     child: SizedBox(
//                       height: 30,
//                       child: SizedBox(
//                         height: 25,
//                         width: 25,
//                         child: CircularProgressIndicator(
//                           valueColor:
//                               AlwaysStoppedAnimation<Color>(Colors.blue),
//                           backgroundColor: Colors.white,
//                           strokeWidth: 2,
//                         ),
//                       ),
//                     ),
//                   ),
//                   errorWidget: (context, url, error) => Icon(Icons.error),
//                 ),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 ' ${course['course_name']}',
//                 style: TextStyle(fontSize: 16, color: Colors.black),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(width: 20),
//       ],
//     );
//   }
// }

// //   Widget _buildCategory(bool isMultiple, int categoryId) {
// //     return SizedBox(
// //       width: MediaQuery.of(context).size.width,
// //       child: Padding(
// //         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             text20(' ${categories[categoryId]['category_name']}', Colors.black),
// //             SizedBox(height: 10),
// //             Container(
// //               height: isMultiple ? 150 : 200,
// //               child: ListView.builder(
// //                 shrinkWrap: true,
// //                 physics: const AlwaysScrollableScrollPhysics(),
// //                 scrollDirection: Axis.horizontal,
// //                 itemCount: courses.length,
// //                 itemBuilder: (context, courseIndex) {
// //                   final course = courses[courseIndex];
// //                   final courseId = course['category_id'];
// //                   final courseIdInt = int.tryParse(courseId);

// //                   if (courseIdInt == categoryId) {
// //                     return Row(
// //                       children: [
// //                         ClipRRect(
// //                           borderRadius: const BorderRadius.only(
// //                             topLeft: Radius.circular(10),
// //                             topRight: Radius.circular(10),
// //                           ),
// //                           child: Column(
// //                             children: [
// //                               Container(
// //                                 height: isMultiple ? 100 : 100,
// //                                 width: isMultiple ? 160 : 220,
// //                                 decoration: BoxDecoration(
// //                                   borderRadius: BorderRadius.circular(5),
// //                                 ),
// //                                 child: CachedNetworkImage(
// //                                   imageUrl: course['course_image'],
// //                                   fit: BoxFit.fill,
// //                                   placeholder: (context, url) => Center(
// //                                     child: SizedBox(
// //                                       height: 30,
// //                                       child: SizedBox(
// //                                         height: 25,
// //                                         width: 25,
// //                                         child: CircularProgressIndicator(
// //                                           valueColor:
// //                                               AlwaysStoppedAnimation<Color>(
// //                                                   Colors.blue),
// //                                           backgroundColor: Colors.white,
// //                                           strokeWidth: 2,
// //                                         ),
// //                                       ),
// //                                     ),
// //                                   ),
// //                                   errorWidget: (context, url, error) =>
// //                                       const Icon(Icons.error),
// //                                 ),
// //                               ),
// //                               SizedBox(height: 10),
// //                               text16(' ${course['course_name']}', Colors.black),
// //                               SizedBox(height: 10),
// //                               SizedBox(
// //                                 width: isMultiple ? 160 : 220,
// //                                 child: ElevatedButton(
// //                                   style: ElevatedButton.styleFrom(
// //                                     shape: RoundedRectangleBorder(
// //                                       borderRadius: BorderRadius.circular(10),
// //                                     ),
// //                                     backgroundColor: Colors.blue,
// //                                   ),
// //                                   onPressed: () {
// //                                     addcart(
// //                                       course['id'].toString(),
// //                                       isMultiple,
// //                                     );
// //                                     print(course['id'].toString());
// //                                   },
// //                                   child: Row(
// //                                     children: [
// //                                       text16(
// //                                         course['price'].toString(),
// //                                         Colors.white,
// //                                       ),
// //                                       SizedBox(width: 20),
// //                                       const Text(
// //                                         'Add To Cart',
// //                                         style: TextStyle(
// //                                           color: Colors.white,
// //                                           fontSize: 16,
// //                                           fontWeight: FontWeight.w700,
// //                                         ),
// //                                       ),
// //                                     ],
// //                                   ),
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //                         ),
// //                         SizedBox(width: 20),
// //                       ],
// //                     );
// //                   } else {
// //                     return Container();
// //                   }
// //                 },
// //               ),
// //             ),
// //             Divider(),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Blue,
// //         shadowColor: black,
// //         title: text20('Course Details', white),
// //         elevation: 3,
// //       ),
// //       body:  );
// //   }
// // }

import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cmedha/Api/Api.dart';
import 'package:cmedha/screens/Constant/color.dart';
import 'package:cmedha/screens/Courses/CourseDetail.dart';
import 'package:cmedha/screens/widget.dart';
import 'package:cmedha/toast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CourseScreen extends StatefulWidget {
  final int type;
  const CourseScreen({Key? key, required this.type}) : super(key: key);

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  List<Map<String, dynamic>> courses = [];
  List<Map<String, dynamic>> categories = [];

  late Future<void> _fetchCourses;
  late Future<void> _fetchCategories;

  @override
  void initState() {
    super.initState();
    _fetchCourses = fetchCourseData();
    _fetchCategories = fetchCategoryData();
  }

  Future<void> fetchCourseData() async {
    final response = await http.post(
      Uri.parse('https://dreams.hashref.org/api/course-type'),
      body: jsonEncode({'type': widget.type.toString()}),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        courses.addAll(List<Map<String, dynamic>>.from(data['course']));
        for (var course in courses) {
          prefs.setInt('course_id_${course['id']}', course['id']);
        }
      });
    } else {
      print('Failed to load course data: ${response.statusCode}');
    }
  }

  Future<void> fetchCategoryData() async {
    final response = await http.post(
      Uri.parse('https://dreams.hashref.org/api/category-type'),
      body: jsonEncode({'type': widget.type.toString()}),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        categories.addAll(List<Map<String, dynamic>>.from(data['category']));

        for (var category in categories) {
          prefs.setInt('category_id_${category['id']}', category['id']);
          prefs.setInt('is_multiple_${category['id']}', category['is_mutiple']);
        }
      });
    } else {
      print('Failed to load category data: ${response.statusCode}');
    }
  }

  addcart(String? courseId, bool isMultiple) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = prefs.getInt('user_id') ?? 0;

    var url = click_cart;
    var urlparse = Uri.parse(url);

    Map<String, String> data;

    if (isMultiple) {
      data = {
        'category_id': courseId ?? '',
        'user_id': userId.toString(),
        'is_mutiple': '1',
      };
    } else {
      data = {
        'course_id': courseId ?? '',
        'user_id': userId.toString(),
        'is_mutiple': '0',
      };
    }

    print(data);

    var body = json.encode(data);

    try {
      var response = await http.post(
        urlparse,
        body: body,
        headers: {
          'Content-Type': 'application/json',
          'accept': 'application/json',
          'Access-Control-Allow-Origin': '*',
        },
      );

      print(response.body);

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        toastInfo(mesg: responseBody['message']);
      } else {
        print('Error: ${response.statusCode}');
        toastInfo(mesg: 'Failed to add to cart');
      }
    } catch (error) {
      print('Error: $error');
      toastInfo(mesg: 'Failed to add to cart');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Blue,
        leading: GestureDetector(
          child: const Icon(
            Icons.chevron_left_outlined,
            size: 30,
            color: Colors.white,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        titleSpacing: 0,
        leadingWidth: 30,
        title: text20('Course Details', white),
        elevation: 3,
      ),
      body: FutureBuilder(
        future: Future.wait([_fetchCourses, _fetchCategories]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, categoryIndex) {
                final category = categories[categoryIndex];
                final isMultiple = category['is_mutiple'] == 1;

                return SizedBox(
                  child: isMultiple
                      ? SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                text20(' ${category['category_name']}', black),
                                SizedBox(height: 10),
                                GestureDetector(
                                  child: Container(
                                    height: 150,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      physics: AlwaysScrollableScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: courses.length,
                                      itemBuilder: (context, courseIndex) {
                                        final course = courses[courseIndex];
                                        final courseId = course['category_id'];
                                        final courseIdInt =
                                            int.tryParse(courseId);

                                        if (courseIdInt == category['id']) {
                                          return Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context).pushAndRemoveUntil(
                                                      MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              CourseDetailPage(
                                                                  id: course[
                                                                          'id']
                                                                      .toString())),
                                                      (Route<dynamic> route) =>
                                                          true);
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        height: 100,
                                                        width: 160,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl: course[
                                                              'course_image'],
                                                          fit: BoxFit.fill,
                                                          placeholder: (context,
                                                                  url) =>
                                                              Center(
                                                                  child:
                                                                      SizedBox(
                                                            height: 30,
                                                            child: SizedBox(
                                                              height: 25,
                                                              width: 25,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  Blue,
                                                                ),
                                                                backgroundColor:
                                                                    Colors
                                                                        .white,
                                                                strokeWidth: 2,
                                                              ),
                                                            ),
                                                          )),
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              Icon(Icons.error),
                                                        ),
                                                      ),
                                                      SizedBox(height: 10),
                                                      text16(
                                                          ' ${course['course_name']}',
                                                          black),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 20),
                                            ],
                                          );
                                        } else {
                                          return Container();
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      backgroundColor: Colors.blue,
                                      minimumSize: const Size.fromHeight(44),
                                    ),
                                    onPressed: () {
                                      addcart(category['id'].toString(), true);
                                      print(category['id'].toString());
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        text16(' ${category['price']}', white),
                                        SizedBox(width: 20),
                                        const Text(
                                          'Add To Cart',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(),
                              ],
                            ),
                          ),
                        )
                      : SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                text20(' ${category['category_name']}', black),
                                SizedBox(height: 10),
                                Container(
                                  height: 200,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: AlwaysScrollableScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: courses.length,
                                    itemBuilder: (context, courseIndex) {
                                      final course = courses[courseIndex];
                                      final courseId = course['category_id'];
                                      final courseIdInt =
                                          int.tryParse(courseId);

                                      if (courseIdInt == category['id']) {
                                        return Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.of(context)
                                                    .pushAndRemoveUntil(
                                                        MaterialPageRoute(
                                                            builder: (BuildContext
                                                                    context) =>
                                                                CourseDetailPage(
                                                                    id: course[
                                                                            'id']
                                                                        .toString())),
                                                        (Route<dynamic>
                                                                route) =>
                                                            true);
                                              },
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                ),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 100,
                                                      width: 220,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: CachedNetworkImage(
                                                        imageUrl: course[
                                                            'course_image'],
                                                        fit: BoxFit.fill,
                                                        placeholder: (context,
                                                                url) =>
                                                            Center(
                                                                child: SizedBox(
                                                                    height: 25,
                                                                    width: 25,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        Blue,
                                                                      ),
                                                                      backgroundColor:
                                                                          Colors
                                                                              .white,
                                                                      strokeWidth:
                                                                          2,
                                                                    ))),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Icon(Icons.error),
                                                      ),
                                                    ),
                                                    SizedBox(height: 10),
                                                    text16(
                                                        ' ${course['course_name']}',
                                                        black),
                                                    SizedBox(height: 10),
                                                    SizedBox(
                                                      width: 220,
                                                      child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          backgroundColor:
                                                              Colors.blue,
                                                        ),
                                                        onPressed: () {
                                                          addcart(
                                                              course['id']
                                                                  .toString(),
                                                              false);
                                                          print(
                                                            course['id']
                                                                .toString(),
                                                          );
                                                        },
                                                        child: Row(
                                                          children: [
                                                            text16(
                                                                course['price']
                                                                    .toString(),
                                                                white),
                                                            SizedBox(width: 20),
                                                            const Text(
                                                              'Add To Cart',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 20),
                                          ],
                                        );
                                      } else {
                                        return Container();
                                      }
                                    },
                                  ),
                                ),
                                Divider(),
                              ],
                            ),
                          ),
                        ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
