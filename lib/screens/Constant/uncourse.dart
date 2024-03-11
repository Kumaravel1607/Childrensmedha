// import 'dart:convert';

// import 'package:cmedha/Api/Api.dart';
// import 'package:cmedha/screens/Constant/color.dart';
// import 'package:cmedha/screens/Courses/CourseDetail.dart';
// import 'package:cmedha/screens/Payment/purchaseDetail.dart';
// import 'package:cmedha/screens/widget.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class CourseScreen extends StatefulWidget {
//   const CourseScreen({super.key});

//   @override
//   State<CourseScreen> createState() => _CourseScreenState();
// }

// class Course {
//   final String name;
//   final String image;

//   final bool isFavorite;

//   Course({required this.image, required this.name, this.isFavorite = false});

//   Course copyWith({String? name, bool? isFavorite}) => Course(
//       name: name ?? this.name,
//       isFavorite: isFavorite ?? this.isFavorite,
//       image: '');
// }

// final List<Course> CourseData = [
//   Course(image: "assets/images/course1.jpg", name: 'Mathematics'),
//   Course(image: 'assets/images/course3.jpg', name: 'Intelligence'),
//   Course(image: 'assets/images/course2.jpg', name: 'English'),
//   Course(image: 'assets/images/course4.jpg', name: 'General'),
// ];

// class _CourseScreenState extends State<CourseScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Blue,
//         automaticallyImplyLeading: false,
//         shadowColor: black,
//         title: text20('Course Details', white),
//         elevation: 3,
//       ),
//       body: ListView.builder(
//           itemCount: categories.length,
//           itemBuilder: (context, categoryIndex) {
//             final category = categories[categoryIndex];
//             final isMultiple = category['is_mutiple'] == 1;

//             return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       text20(
//                           category['category_name'],
//                           //'6th Grade\n(SAINIK/RMS/RIMS)',
//                           black),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.of(context, rootNavigator: true).push(
//                             MaterialPageRoute(
//                                 builder: (context) => const CourseDetailPage()),
//                           );
//                         },
//                         child: text16('View more >', Blue),
//                       ),
//                       // ElevatedButton(
//                       //   child: text16('Add to cart', white),
//                       //   onPressed: () {},
//                       //   style: ElevatedButton.styleFrom(
//                       //     backgroundColor: Blue,
//                       //     shape: RoundedRectangleBorder(
//                       //       borderRadius: new BorderRadius.circular(10.0),
//                       //     ),
//                       //   ),
//                       // ),
//                     ],
//                   ),
//                   ListView.builder(
//                     // itemCount: CourseData.length,
//                     // scrollDirection: Axis.horizontal,
//                     shrinkWrap: true,
//                     physics: ClampingScrollPhysics(),
//                     itemCount: courses.length,
//                     itemBuilder: (context, courseIndex) {
//                       final course = courses[courseIndex];
//                       final courseId = course['category_id'];
//                       final isMatchingCategory = courseId == category['id'];

//                       if (isMatchingCategory)
//                         // itemBuilder:
//                         //     (BuildContext context, int index) {

//                         return GestureDetector(
//                           onTap: () {
//                             Navigator.of(context, rootNavigator: true).push(
//                               MaterialPageRoute(
//                                   builder: (context) =>
//                                       const CourseDetailPage()),
//                             );
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 10),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 ClipRRect(
//                                   borderRadius: BorderRadius.circular(10),
//                                   child:
//                                       //  Image.asset(
//                                       //   course['course_image'],
//                                       //   // CourseData[index].image,
//                                       //   // "assets/images/course${index + 1}.png",
//                                       //   width: 150,
//                                       //   height: 130,
//                                       //   fit: BoxFit.fill,
//                                       // ),
//                                       Container(
//                                     height: 120,
//                                     width: 100,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(5),
//                                       image: DecorationImage(
//                                         image: NetworkImage(
//                                           course['course_image'],
//                                         ),

//                                         // image: AssetImage(
//                                         //   'assets/images/car02.jpeg',
//                                         // ),
//                                         fit: BoxFit.fill,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 10,
//                                 ),
//                                 text16(
//                                     course['course_name'],
//                                     // CourseData[index].name,
//                                     Colors.black
//                                     // 'English'

//                                     ),
//                                 Padding(
//                                   padding: EdgeInsets.symmetric(horizontal: 20),
//                                   child: ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                       shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(10)),
//                                       backgroundColor: Blue,
//                                       minimumSize: Size.fromHeight(44),
//                                     ),
//                                     // onPressed: () {},
//                                     onPressed: () {
//                                       Navigator.of(context, rootNavigator: true)
//                                           .push(MaterialPageRoute(
//                                               builder: (context) =>
//                                                   PurchaseDetail()));
//                                       //   //   Navigator.of(context).push(MaterialPageRoute(
//                                       //   //       builder: (context) => Navigation()));
//                                     },
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         isMultiple
//                                             ? text20(
//                                                 'Category Price: ${category['category_price']}',
//                                                 white)
//                                             : text20(
//                                                 'Price: ${course['price']}',
//                                                 white),
//                                         // text20(' \$2500', white),

//                                         SizedBox(
//                                           width: 20,
//                                         ),
//                                         const Text(
//                                           'Add To Cart',
//                                           style: TextStyle(
//                                             color: white,
//                                             fontSize: 16,
//                                             fontFamily: 'IBMPlexSans',
//                                             fontWeight: FontWeight.w700,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 const Divider(
//                                   thickness: 2,
//                                   color: grey,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       return Container();
//                     },
//                   ),
//                 ]);
//           }),
//     );
//   }

//   // List<Map<String, dynamic>> courses = [];
//   // List<Map<String, dynamic>> categories = [];

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   fetchData();
//   // }

//   // Future<void> fetchData() async {
//   //   // var urlparse = Uri.parse(url);

//   //   try {
//   //     final responseCourses =
//   //         await http.get(Uri.parse('https://dreams.hashref.org/api/course'));
//   //     final responseCategories =
//   //         await http.get(Uri.parse('https://dreams.hashref.org/api/category'));

//   //     if (responseCourses.statusCode == 200 &&
//   //         responseCategories.statusCode == 200) {
//   //       final Map<String, dynamic> dataCourses =
//   //           json.decode(responseCourses.body);
//   //       final Map<String, dynamic> dataCategories =
//   //           json.decode(responseCategories.body);

//   //       setState(() {
//   //         courses = List<Map<String, dynamic>>.from(dataCourses['course']);
//   //         categories =
//   //             List<Map<String, dynamic>>.from(dataCategories['category']);
//   //       });
//   //     } else {
//   //       // Handle the error
//   //       print('Failed to load data: ${responseCourses.statusCode}');
//   //     }
//   //   } catch (e) {
//   //     print('Error: $e');
//   //   }
//   // }

//   ///////

//   List<Map<String, dynamic>> courses = [];
//   List<Map<String, dynamic>> categories = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchCourseData();
//     fetchCategoryData();
//   }

//   Future<void> fetchCourseData() async {
//     final response =
//         await http.get(Uri.parse('https://dreams.hashref.org/api/course'));

//     if (response.statusCode == 200) {
//       final Map<String, dynamic> data = json.decode(response.body);

//       setState(() {
//         courses = List<Map<String, dynamic>>.from(data['course']);
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

//       setState(() {
//         categories = List<Map<String, dynamic>>.from(data['category']);
//       });
//     } else {
//       // Handle the error
//       print('Failed to load category data: ${response.statusCode}');
//     }
//   }
// }

import 'dart:convert';

import 'package:cmedha/screens/Constant/color.dart';
import 'package:cmedha/screens/Payment/purchaseDetail.dart';
import 'package:cmedha/screens/widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class CourseScreen extends StatefulWidget {
  const CourseScreen({Key? key}) : super(key: key);

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  List<Map<String, dynamic>> courses = [];
  List<Map<String, dynamic>> categories = [];

  @override
  void initState() {
    super.initState();
    fetchCourseData();
    fetchCategoryData();
  }

  Future<void> fetchCourseData() async {
    final response =
        await http.get(Uri.parse('https://dreams.hashref.org/api/course'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      setState(() {
        courses = List<Map<String, dynamic>>.from(data['course']);
      });
    } else {
      // Handle the error
      print('Failed to load course data: ${response.statusCode}');
    }
  }

  Future<void> fetchCategoryData() async {
    final response =
        await http.get(Uri.parse('https://dreams.hashref.org/api/category'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      setState(() {
        categories = List<Map<String, dynamic>>.from(data['category']);
      });
    } else {
      // Handle the error
      print('Failed to load category data: ${response.statusCode}');
    }
  }

  String? course_price;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        title: Text('Course Details', style: TextStyle(color: Colors.white)),
        elevation: 3,
      ),
      body: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical, // Set scroll direction to horizontal
        itemCount: categories.length,
        itemBuilder: (context, categoryIndex) {
          final category = categories[categoryIndex];
          final isMultiple = category['is_mutiple'] == 1;

          return SizedBox(
            child: !isMultiple
                ? Container(
                    width: MediaQuery.of(context)
                        .size
                        .width, // Set the width to the screen width
                    //height: 300,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              text20(' ${category['category_name']}', black),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 200, // Set the height as needed
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis
                                      .horizontal, // Set scroll direction to horizontal
                                  itemCount: courses.length,
                                  itemBuilder: (context, courseIndex) {
                                    final course = courses[courseIndex];
                                    final courseId = course['category_id'];
                                    final course_price = course['price'];
                                    final courseIdInt = int.tryParse(courseId);

                                    if (courseIdInt == category['id']) {
                                      return Row(
                                        children: [
                                          Column(
                                            children: [
                                              text16(
                                                  ' ${course['course_name']}',
                                                  black),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Container(
                                                  height: 100,
                                                  width: 150,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                          course[
                                                              'course_image']),
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),

                                          // Add space between items if needed
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                backgroundColor: Colors.blue,
                                                minimumSize:
                                                    const Size.fromHeight(44),
                                              ),
                                              onPressed: () {
                                                // Move the course declaration here
                                                final course =
                                                    courses.firstWhere((c) =>
                                                        int.tryParse(
                                                            c['category_id']) ==
                                                        category['id']);

                                                Navigator.of(context,
                                                        rootNavigator: true)
                                                    .push(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        PurchaseDetail(),
                                                  ),
                                                );
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  text20(
                                                      ' ${category['category_price']}',
                                                      white),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  const Text(
                                                    'Add To Cart',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      );
                                    } else {
                                      return Container();
                                    }
                                  },
                                ),
                              )
                            ])))
                : Container(
                    width: MediaQuery.of(context)
                        .size
                        .width, // Set the width to the screen width
                    //height: 300,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          text20(' ${category['category_name']}', black),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 200, // Set the height as needed
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis
                                  .horizontal, // Set scroll direction to horizontal
                              itemCount: courses.length,
                              itemBuilder: (context, courseIndex) {
                                final course = courses[courseIndex];
                                final courseId = course['category_id'];
                                final course_price = course['price'];
                                final courseIdInt = int.tryParse(courseId);

                                if (courseIdInt == category['id']) {
                                  return Row(
                                    children: [
                                      Column(
                                        children: [
                                          text16(' ${course['course_name']}',
                                              black),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Container(
                                              height: 100,
                                              width: 150,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      course['course_image']),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 130,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                backgroundColor: Colors.blue,
                                              ),
                                              onPressed: () {},
                                              child: Row(
                                                children: [
                                                  text20(
                                                      course['price']
                                                          .toString(),
                                                      white),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  FaIcon(Icons.shopping_cart,
                                                      color: white),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ), // Add space between items if needed
                                    ],
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            ),
                          ),

                          // isMultiple
                          //     ? Padding(
                          //         padding: const EdgeInsets.symmetric(horizontal: 20),
                          //         child: ElevatedButton(
                          //           style: ElevatedButton.styleFrom(
                          //             shape: RoundedRectangleBorder(
                          //                 borderRadius: BorderRadius.circular(10)),
                          //             backgroundColor: Colors.blue,
                          //             minimumSize: const Size.fromHeight(44),
                          //           ),
                          //           onPressed: () {
                          //             // Move the course declaration here
                          //             final course = courses.firstWhere((c) =>
                          //                 int.tryParse(c['category_id']) ==
                          //                 category['id']);

                          //             Navigator.of(context, rootNavigator: true).push(
                          //               MaterialPageRoute(
                          //                 builder: (context) => PurchaseDetail(),
                          //               ),
                          //             );
                          //           },
                          //           child: Row(
                          //             mainAxisAlignment: MainAxisAlignment.center,
                          //             children: [
                          //               text20(' ${category['category_price']}', white),
                          //               SizedBox(
                          //                 width: 20,
                          //               ),
                          //               const Text(
                          //                 'Add To Cart',
                          //                 style: TextStyle(
                          //                   color: Colors.white,
                          //                   fontSize: 16,
                          //                   fontWeight: FontWeight.w700,
                          //                 ),
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       )
                          //     : Container(),
                          Divider(),
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
// import 'package:cmedha/screens/Constant/color.dart';
// import 'package:cmedha/screens/Courses/CourseDetail.dart';
// import 'package:cmedha/screens/Payment/purchaseDetail.dart';
// import 'package:cmedha/screens/widget.dart';
// import 'package:flutter/material.dart';

// class CourseScreen extends StatefulWidget {
//   const CourseScreen({super.key});

//   @override
//   State<CourseScreen> createState() => _CourseScreenState();
// }

// class Course {
//   final String name;
//   final String image;

//   final bool isFavorite;

//   Course({required this.image, required this.name, this.isFavorite = false});

//   Course copyWith({String? name, bool? isFavorite}) => Course(
//       name: name ?? this.name,
//       isFavorite: isFavorite ?? this.isFavorite,
//       image: '');
// }

// final List<Course> CourseData = [
//   Course(image: "assets/images/course1.jpg", name: 'Mathematics'),
//   Course(image: 'assets/images/course3.jpg', name: 'Intelligence'),
//   Course(image: 'assets/images/course2.jpg', name: 'English'),
//   Course(image: 'assets/images/course4.jpg', name: 'General'),
// ];

// class _CourseScreenState extends State<CourseScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Blue,
//         automaticallyImplyLeading: false,
//         shadowColor: black,
//         title: text20('Course Details', white),
//         elevation: 3,
//       ),
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.only(top: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       text20('6th Grade\n(SAINIK/RMS/RIMS)', black),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.of(context, rootNavigator: true).push(
//                             MaterialPageRoute(
//                                 builder: (context) => const CourseDetailPage()),
//                           );
//                         },
//                         child: text16('View more >', Blue),
//                       ),
//                       // ElevatedButton(
//                       //   child: text16('Add to cart', white),
//                       //   onPressed: () {},
//                       //   style: ElevatedButton.styleFrom(
//                       //     backgroundColor: Blue,
//                       //     shape: RoundedRectangleBorder(
//                       //       borderRadius: new BorderRadius.circular(10.0),
//                       //     ),
//                       //   ),
//                       // ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 SizedBox(
//                   height: 180,
//                   child: ListView.builder(
//                     itemCount: CourseData.length,
//                     scrollDirection: Axis.horizontal,
//                     itemBuilder: (BuildContext context, int index) {
//                       return GestureDetector(
//                         onTap: () {
//                           Navigator.of(context, rootNavigator: true).push(
//                             MaterialPageRoute(
//                                 builder: (context) => const CourseDetailPage()),
//                           );
//                         },
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 10),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               ClipRRect(
//                                   borderRadius: BorderRadius.circular(10),
//                                   child: Image.asset(
//                                     CourseData[index].image,
//                                     // "assets/images/course${index + 1}.png",
//                                     width: 150,
//                                     height: 130,
//                                     fit: BoxFit.fill,
//                                   )),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               text16(CourseData[index].name, Colors.black
//                                   // 'English'

//                                   )
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                       backgroundColor: Blue,
//                       minimumSize: const Size.fromHeight(44),
//                     ),
//                     // onPressed: () {},
//                     onPressed: () {
//                       Navigator.of(context, rootNavigator: true).push(
//                           MaterialPageRoute(
//                               builder: (context) => PurchaseDetail()));
//                       //   //   Navigator.of(context).push(MaterialPageRoute(
//                       //   //       builder: (context) => Navigation()));
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         text20(' \$2500', white),
//                         SizedBox(
//                           width: 20,
//                         ),
//                         const Text(
//                           'Add To Cart',
//                           style: TextStyle(
//                             color: white,
//                             fontSize: 16,
//                             fontFamily: 'IBMPlexSans',
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const Divider(
//                   thickness: 2,
//                   color: grey,
//                 ),
//                 // SizedBox(
//                 //   height: 20,
//                 // ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       text20('9th Grade\n(SAINIK/RMS/RIMS)', black),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.of(context, rootNavigator: true).push(
//                             MaterialPageRoute(
//                                 builder: (context) => const CourseDetailPage()),
//                           );
//                           // Navigator.of(context).pushAndRemoveUntil(
//                           //     MaterialPageRoute(
//                           //         builder: (BuildContext context) =>
//                           //             CourseDetailPage()),
//                           //     (Route<dynamic> route) => false);
//                           // Navigator.of(context, rootNavigator: true)
//                           //     .pushAndRemoveUntil(
//                           //   MaterialPageRoute(
//                           //     builder: (BuildContext context) {
//                           //       return CourseDetailPage();
//                           //     },
//                           //   ),
//                           //   (_) => false,
//                           // );
//                         },
//                         child: text16('View more >', Blue),
//                       ),
//                       // ElevatedButton(
//                       //   child: text16('Add to cart', white),
//                       //   onPressed: () {},
//                       //   style: ElevatedButton.styleFrom(
//                       //     backgroundColor: Blue,
//                       //     shape: RoundedRectangleBorder(
//                       //       borderRadius: new BorderRadius.circular(10.0),
//                       //     ),
//                       //   ),
//                       // ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 SizedBox(
//                   height: 180,
//                   child: ListView.builder(
//                     itemCount: CourseData.length,
//                     scrollDirection: Axis.horizontal,
//                     itemBuilder: (BuildContext context, int index) {
//                       return Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 10),
//                         child: Column(
//                           children: [
//                             ClipRRect(
//                                 borderRadius: BorderRadius.circular(10),
//                                 // decoration: BoxDecoration(
//                                 //     borderRadius: BorderRadius.circular(10),
//                                 //     border: Border.all(color: Colors.grey[300]!)),
//                                 // height: 100,
//                                 // width: 100,
//                                 child: Image.asset(
//                                   CourseData[index].image,
//                                   // "assets/images/course${index + 1}.png",
//                                   width: 150,
//                                   height: 130,
//                                   fit: BoxFit.fill,
//                                 )),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             text16(CourseData[index].name, Colors.black
//                                 // 'English'
//                                 )
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                       backgroundColor: Blue,
//                       minimumSize: const Size.fromHeight(44),
//                     ),
//                     // onPressed: () {},
//                     onPressed: () {
//                       Navigator.of(context, rootNavigator: true).push(
//                           MaterialPageRoute(
//                               builder: (context) => PurchaseDetail()));
//                       //   Navigator.of(context).push(MaterialPageRoute(
//                       //       builder: (context) => Navigation()));
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         text20(' \$2500', white),
//                         SizedBox(
//                           width: 20,
//                         ),
//                         const Text(
//                           'Add To Cart',
//                           style: TextStyle(
//                             color: white,
//                             fontSize: 16,
//                             fontFamily: 'IBMPlexSans',
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const Divider(
//                   thickness: 2,
//                   color: grey,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       text20('Academic skills', black),
//                       // ElevatedButton(
//                       //   child: text16('Add to cart', white),
//                       //   onPressed: () {},
//                       //   style: ElevatedButton.styleFrom(
//                       //     backgroundColor: Blue,
//                       //     shape: RoundedRectangleBorder(
//                       //       borderRadius: new BorderRadius.circular(10.0),
//                       //     ),
//                       //   ),
//                       // ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: ClipRRect(
//                       borderRadius: BorderRadius.circular(10),
//                       // decoration: BoxDecoration(
//                       //     borderRadius: BorderRadius.circular(10),
//                       //     border: Border.all(color: Colors.grey[300]!)),
//                       // height: 100,
//                       // width: 100,
//                       child: Image.asset(
//                         'assets/images/course4.jpg',
//                         // "assets/images/course${index + 1}.png",
//                         width: 150,
//                         height: 130,
//                         fit: BoxFit.fill,
//                       )),
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                       backgroundColor: Blue,
//                       minimumSize: const Size.fromHeight(44),
//                     ),
//                     // onPressed: () {},
//                     onPressed: () {
//                       Navigator.of(context, rootNavigator: true).push(
//                           MaterialPageRoute(
//                               builder: (context) => PurchaseDetail()));
//                       //   Navigator.of(context).push(MaterialPageRoute(
//                       //       builder: (context) => Navigation()));
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         text20(' \$2500', white),
//                         SizedBox(
//                           width: 20,
//                         ),
//                         const Text(
//                           'Add To Cart',
//                           style: TextStyle(
//                             color: white,
//                             fontSize: 16,
//                             fontFamily: 'IBMPlexSans',
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'dart:convert';

// import 'package:cmedha/screens/Constant/color.dart';
// import 'package:cmedha/screens/Payment/purchaseDetail.dart';
// import 'package:cmedha/screens/widget.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:http/http.dart' as http;

// class CourseScreen extends StatefulWidget {
//   const CourseScreen({Key? key}) : super(key: key);

//   @override
//   State<CourseScreen> createState() => _CourseScreenState();
// }

// class _CourseScreenState extends State<CourseScreen> {
//   List<Map<String, dynamic>> courses = [];
//   List<Map<String, dynamic>> categories = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchCourseData();
//     fetchCategoryData();
//   }

//   Future<void> fetchCourseData() async {
//     final response =
//         await http.get(Uri.parse('https://dreams.hashref.org/api/course'));

//     if (response.statusCode == 200) {
//       final Map<String, dynamic> data = json.decode(response.body);

//       setState(() {
//         courses = List<Map<String, dynamic>>.from(data['course']);
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

//       setState(() {
//         categories = List<Map<String, dynamic>>.from(data['category']);
//       });
//     } else {
//       // Handle the error
//       print('Failed to load category data: ${response.statusCode}');
//     }
//   }

//   String? course_price;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         automaticallyImplyLeading: false,
//         title: Text('Course Details', style: TextStyle(color: Colors.white)),
//         elevation: 3,
//       ),
//       body: ListView.builder(
//         padding: EdgeInsets.zero,
//         scrollDirection: Axis.vertical, // Set scroll direction to horizontal
//         itemCount: categories.length,
//         itemBuilder: (context, categoryIndex) {
//           final category = categories[categoryIndex];
//           final isMultiple = category['is_mutiple'] == 1;

//           return Container(
//             width: MediaQuery.of(context)
//                 .size
//                 .width, // Set the width to the screen width
//             //height: 300,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   text20(' ${category['category_name']}', black),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     height: 180, // Set the height as needed
//                     child: ListView.builder(
//                       shrinkWrap: true,
//                       physics: NeverScrollableScrollPhysics(),
//                       scrollDirection:
//                           Axis.horizontal, // Set scroll direction to horizontal
//                       itemCount: courses.length,
//                       itemBuilder: (context, courseIndex) {
//                         final course = courses[courseIndex];
//                         final courseId = course['category_id'];
//                         final course_price = course['price'];
//                         final courseIdInt = int.tryParse(courseId);

//                         if (courseIdInt == category['id']) {
//                           return Row(
//                             children: [
//                               Column(
//                                 children: [
//                                   ClipRRect(
//                                     borderRadius: BorderRadius.circular(10),
//                                     child: Container(
//                                       height: 100,
//                                       width: 150,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(5),
//                                         image: DecorationImage(
//                                           image: NetworkImage(
//                                               course['course_image']),
//                                           fit: BoxFit.fill,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   text16(' ${course['course_name']}', black),
//                                   !isMultiple
//                                       ? SizedBox(
//                                           width: 130,
//                                           child: ElevatedButton(
//                                             style: ElevatedButton.styleFrom(
//                                               shape: RoundedRectangleBorder(
//                                                   borderRadius:
//                                                       BorderRadius.circular(
//                                                           10)),
//                                               backgroundColor: Colors.blue,
//                                             ),
//                                             onPressed: () {},
//                                             child: Row(
//                                               children: [
//                                                 text20(
//                                                     course['price'].toString(),
//                                                     white),
//                                                 SizedBox(
//                                                   width: 10,
//                                                 ),
//                                                 FaIcon(Icons.shopping_cart,
//                                                     color: white),
//                                               ],
//                                             ),
//                                           ),
//                                         )
//                                       : Container()
//                                 ],
//                               ),
//                               SizedBox(
//                                 width: 20,
//                               ), // Add space between items if needed
//                             ],
//                           );
//                         } else {
//                           return Container();
//                         }
//                       },
//                     ),
//                   ),
//                   isMultiple
//                       ? Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 20),
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10)),
//                               backgroundColor: Colors.blue,
//                               minimumSize: const Size.fromHeight(44),
//                             ),
//                             onPressed: () {
//                               // Move the course declaration here
//                               final course = courses.firstWhere((c) =>
//                                   int.tryParse(c['category_id']) ==
//                                   category['id']);

//                               Navigator.of(context, rootNavigator: true).push(
//                                 MaterialPageRoute(
//                                   builder: (context) => PurchaseDetail(),
//                                 ),
//                               );
//                             },
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 text20(' ${category['category_price']}', white),
//                                 SizedBox(
//                                   width: 20,
//                                 ),
//                                 const Text(
//                                   'Add To Cart',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w700,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         )
//                       : Container(),
//                   Divider(),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// import 'dart:convert';

// import 'package:cmedha/Api/Api.dart';
// import 'package:cmedha/screens/Constant/color.dart';
// import 'package:cmedha/screens/Courses/CourseDetail.dart';
// import 'package:cmedha/screens/Payment/purchaseDetail.dart';
// import 'package:cmedha/screens/widget.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class CourseScreen extends StatefulWidget {
//   const CourseScreen({super.key});

//   @override
//   State<CourseScreen> createState() => _CourseScreenState();
// }

// class Course {
//   final String name;
//   final String image;

//   final bool isFavorite;

//   Course({required this.image, required this.name, this.isFavorite = false});

//   Course copyWith({String? name, bool? isFavorite}) => Course(
//       name: name ?? this.name,
//       isFavorite: isFavorite ?? this.isFavorite,
//       image: '');
// }

// final List<Course> CourseData = [
//   Course(image: "assets/images/course1.jpg", name: 'Mathematics'),
//   Course(image: 'assets/images/course3.jpg', name: 'Intelligence'),
//   Course(image: 'assets/images/course2.jpg', name: 'English'),
//   Course(image: 'assets/images/course4.jpg', name: 'General'),
// ];

// class _CourseScreenState extends State<CourseScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Blue,
//         automaticallyImplyLeading: false,
//         shadowColor: black,
//         title: text20('Course Details', white),
//         elevation: 3,
//       ),
//       body:
//       ListView.builder(
//         // scrollDirection: Axis.horizontal,
//         shrinkWrap: true,
//         // physics: ClampingScrollPhysics(),
//         itemCount: categories.length,
//         itemBuilder: (context, categoryIndex) {
//           final category = categories[categoryIndex];
//           final isMultiple = category['is_mutiple'] == 1;

//           return Expanded(
//             child: Column(
//               //crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(category['category_name']),
//                 GridView.builder(
//                   shrinkWrap: true,
//                   physics: NeverScrollableScrollPhysics(),
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 3, // Number of columns in the grid
//                   ),
//                   // scrollDirection: Axis.horizontal,

//                   itemCount: courses.length,
//                   itemBuilder: (context, courseIndex) {
//                     final course = courses[courseIndex];
//                     final courseId = course['category_id'];
//                     final courseIdInt = int.tryParse(courseId);

//                     if (courseIdInt == category['id']) {
//                       return Column(
//                         children: [
//                           Text(course['course_name']),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           ClipRRect(
//                               borderRadius: BorderRadius.circular(10),
//                               child: Container(
//                                 height: 80,
//                                 width: 90,

//                                 //  Image.network(course['course_image']),
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(5),
//                                   image: DecorationImage(
//                                     image: NetworkImage(course['course_image']),

//                                     // image: AssetImage(
//                                     //   'assets/images/car02.jpeg',
//                                     // ),
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               )),
//                           // isMultiple
//                           //     ? Text('catPrice: ${category['category_price']}')
//                           //     : Text('Price: ${course['price']}'),
//                           // ListTile(
//                           //   // title: Text(course['course_name']),
//                           //   leading: Image.network(course['course_image']),
//                           //   subtitle: isMultiple
//                           //       ? Text('catPrice: ${category['category_price']}')
//                           //       : Text('Price: ${course['price']}'),
//                           // ),
//                           // Padding(
//                           //   padding: const EdgeInsets.symmetric(horizontal: 20),
//                           //   child: ElevatedButton(
//                           //     style: ElevatedButton.styleFrom(
//                           //       shape: RoundedRectangleBorder(
//                           //           borderRadius: BorderRadius.circular(10)),
//                           //       backgroundColor: Blue,
//                           //       minimumSize: const Size.fromHeight(44),
//                           //     ),
//                           //     // onPressed: () {},
//                           //     onPressed: () {
//                           //       Navigator.of(context, rootNavigator: true).push(
//                           //           MaterialPageRoute(
//                           //               builder: (context) => PurchaseDetail()));
//                           //       //   //   Navigator.of(context).push(MaterialPageRoute(
//                           //       //   //       builder: (context) => Navigation()));
//                           //     },
//                           //     child: Row(
//                           //       mainAxisAlignment: MainAxisAlignment.center,
//                           //       children: [
//                           //         isMultiple
//                           //             ? Text(
//                           //                 'catPrice: ${category['category_price']}')
//                           //             : Text('Price: ${course['price']}'),
//                           //         SizedBox(
//                           //           width: 20,
//                           //         ),
//                           //         const Text(
//                           //           'Add To Cart',
//                           //           style: TextStyle(
//                           //             color: white,
//                           //             fontSize: 16,
//                           //             fontFamily: 'IBMPlexSans',
//                           //             fontWeight: FontWeight.w700,
//                           //           ),
//                           //         ),
//                           //       ],
//                           //     ),
//                           //   ),
//                           // ),
//                         ],
//                       );
//                     } else {
//                       return Container(); // Empty container if the course doesn't match the category
//                     }
//                   },
//                 ),
//                  Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 20),
//                             child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10)),
//                                 backgroundColor: Blue,
//                                 minimumSize: const Size.fromHeight(44),
//                               ),
//                               // onPressed: () {},
//                               onPressed: () {
//                                 Navigator.of(context, rootNavigator: true).push(
//                                     MaterialPageRoute(
//                                         builder: (context) => PurchaseDetail()));
//                                 //   //   Navigator.of(context).push(MaterialPageRoute(
//                                 //   //       builder: (context) => Navigation()));
//                               },
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   isMultiple
//                                       ? Text(
//                                           'catPrice: ${category['category_price']}')
//                                       : Text('Price: ${course['price']}'),
//                                   SizedBox(
//                                     width: 20,
//                                   ),
//                                   const Text(
//                                     'Add To Cart',
//                                     style: TextStyle(
//                                       color: white,
//                                       fontSize: 16,
//                                       fontFamily: 'IBMPlexSans',
//                                       fontWeight: FontWeight.w700,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                 // isMultiple
//                 //     ? Text('catPrice: ${category['category_price']}')
//                 //     : Text('Price: ${course['price']}'),
//                 Divider(),
//               ],
//             ),
//           );
//         },
//       ),

//       // ListView.builder(
//       //   itemCount: categories.length,
//       //   itemBuilder: (context, categoryIndex) {
//       //     final category = categories[categoryIndex];
//       //     final isMultiple = category['is_mutiple'] == 1;

//       //     return Column(
//       //       children: [
//       //         ListView.builder(
//       //           shrinkWrap: true,
//       //           physics: ClampingScrollPhysics(),
//       //           itemCount: courses.length,
//       //           itemBuilder: (context, courseIndex) {
//       //             final course = courses[courseIndex];
//       //             final courseId = course['category_id'];
//       //             final isMatchingCategory = courseId == category['id'];

//       //             if (isMatchingCategory) {
//       //               return ListTile(
//       //                 title: Text(course['course_name']),
//       //                 subtitle: isMultiple
//       //                     ? Text(
//       //                         'Category Price: ${category['category_price']}')
//       //                     : Text('Price: ${course['price']}'),
//       //                 leading: Image.network(course['course_image']),
//       //               );
//       //             }

//       //             // Return an empty container if the course doesn't match the category
//       //             return Container();
//       //           },
//       //         ),
//       //       ],
//       //     );
//       //   },
//       // ),
//     );
//   }

//   // List<Map<String, dynamic>> courses = [];
//   // List<Map<String, dynamic>> categories = [];

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   fetchData();
//   // }

//   // Future<void> fetchData() async {
//   //   // var urlparse = Uri.parse(url);

//   //   try {
//   //     final responseCourses =
//   //         await http.get(Uri.parse('https://dreams.hashref.org/api/course'));
//   //     final responseCategories =
//   //         await http.get(Uri.parse('https://dreams.hashref.org/api/category'));

//   //     if (responseCourses.statusCode == 200 &&
//   //         responseCategories.statusCode == 200) {
//   //       final Map<String, dynamic> dataCourses =
//   //           json.decode(responseCourses.body);
//   //       final Map<String, dynamic> dataCategories =
//   //           json.decode(responseCategories.body);

//   //       setState(() {
//   //         courses = List<Map<String, dynamic>>.from(dataCourses['course']);
//   //         categories =
//   //             List<Map<String, dynamic>>.from(dataCategories['category']);
//   //       });
//   //     } else {
//   //       // Handle the error
//   //       print('Failed to load data: ${responseCourses.statusCode}');
//   //     }
//   //   } catch (e) {
//   //     print('Error: $e');
//   //   }
//   // }

//   ///////

//   List<Map<String, dynamic>> courses = [];
//   List<Map<String, dynamic>> categories = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchCourseData();
//     fetchCategoryData();
//   }

//   Future<void> fetchCourseData() async {
//     final response =
//         await http.get(Uri.parse('https://dreams.hashref.org/api/course'));

//     if (response.statusCode == 200) {
//       final Map<String, dynamic> data = json.decode(response.body);

//       setState(() {
//         courses = List<Map<String, dynamic>>.from(data['course']);
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

//       setState(() {
//         categories = List<Map<String, dynamic>>.from(data['category']);
//       });
//     } else {
//       // Handle the error
//       print('Failed to load category data: ${response.statusCode}');
//     }
//   }
// }

// import 'dart:convert';

// import 'package:cmedha/screens/Constant/color.dart';
// import 'package:cmedha/screens/Payment/purchaseDetail.dart';
// import 'package:cmedha/screens/widget.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class CourseScreen extends StatefulWidget {
//   const CourseScreen({Key? key}) : super(key: key);

//   @override
//   State<CourseScreen> createState() => _CourseScreenState();
// }

// class _CourseScreenState extends State<CourseScreen> {
//   List<Map<String, dynamic>> courses = [];
//   List<Map<String, dynamic>> categories = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchCourseData();
//     fetchCategoryData();
//   }

//   Future<void> fetchCourseData() async {
//     final response =
//         await http.get(Uri.parse('https://dreams.hashref.org/api/course'));

//     if (response.statusCode == 200) {
//       final Map<String, dynamic> data = json.decode(response.body);

//       setState(() {
//         courses = List<Map<String, dynamic>>.from(data['course']);
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

//       setState(() {
//         categories = List<Map<String, dynamic>>.from(data['category']);
//       });
//     } else {
//       // Handle the error
//       print('Failed to load category data: ${response.statusCode}');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         automaticallyImplyLeading: false,
//         title: Text('Course Details', style: TextStyle(color: Colors.white)),
//         elevation: 3,
//       ),
//       body: ListView.builder(
//         itemCount: categories.length,
//         itemBuilder: (context, categoryIndex) {
//           final category = categories[categoryIndex];
//           final isMultiple = category['is_mutiple'] == 1;

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
//                             height: 200,
//                             child: ListView.builder(
//                               shrinkWrap: true,
//                               physics: NeverScrollableScrollPhysics(),
//                               scrollDirection: Axis.horizontal,
//                               itemCount: courses.length,
//                               itemBuilder: (context, courseIndex) {
//                                 final course = courses[courseIndex];
//                                 final courseId = course['category_id'];
//                                 final courseIdInt = int.tryParse(courseId);

//                                 if (courseIdInt == category['id']) {
//                                   return Row(
//                                     children: [
//                                       Column(
//                                         children: [
//                                           text16(' ${course['course_name']}',
//                                               black),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           ClipRRect(
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                             child: Container(
//                                               height: 100,
//                                               width: 150,
//                                               decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     BorderRadius.circular(5),
//                                                 image: DecorationImage(
//                                                   image: NetworkImage(
//                                                       course['course_image']),
//                                                   fit: BoxFit.fill,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                             horizontal: 20),
//                                         child: ElevatedButton(
//                                           style: ElevatedButton.styleFrom(
//                                             shape: RoundedRectangleBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(10)),
//                                             backgroundColor: Colors.blue,
//                                             minimumSize:
//                                                 const Size.fromHeight(44),
//                                           ),
//                                           onPressed: () {
//                                             Navigator.of(context,
//                                                     rootNavigator: true)
//                                                 .push(
//                                               MaterialPageRoute(
//                                                 builder: (context) =>
//                                                     PurchaseDetail(),
//                                               ),
//                                             );
//                                           },
//                                           child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: [
//                                               text20(
//                                                   ' ${category['category_price']}',
//                                                   white),
//                                               SizedBox(
//                                                 width: 20,
//                                               ),
//                                               const Text(
//                                                 'Add To Cart',
//                                                 style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 16,
//                                                   fontWeight: FontWeight.w700,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   );
//                                 } else {
//                                   return Container();
//                                 }
//                               },
//                             ),
//                           )
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
//                               physics: NeverScrollableScrollPhysics(),
//                               scrollDirection: Axis.horizontal,
//                               itemCount: courses.length,
//                               itemBuilder: (context, courseIndex) {
//                                 final course = courses[courseIndex];
//                                 final courseId = course['category_id'];
//                                 final courseIdInt = int.tryParse(courseId);

//                                 if (courseIdInt == category['id']) {
//                                   return Row(
//                                     children: [
//                                       Column(
//                                         children: [
//                                           text16(' ${course['course_name']}',
//                                               black),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           ClipRRect(
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                             child: Container(
//                                               height: 100,
//                                               width: 150,
//                                               decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     BorderRadius.circular(5),
//                                                 image: DecorationImage(
//                                                   image: NetworkImage(
//                                                       course['course_image']),
//                                                   fit: BoxFit.fill,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             width: 130,
//                                             child: ElevatedButton(
//                                               style: ElevatedButton.styleFrom(
//                                                 shape: RoundedRectangleBorder(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             10)),
//                                                 backgroundColor: Colors.blue,
//                                               ),
//                                               onPressed: () {},
//                                               child: Row(
//                                                 children: [
//                                                   text20(
//                                                       course['price']
//                                                           .toString(),
//                                                       white),
//                                                   SizedBox(
//                                                     width: 10,
//                                                   ),
//                                                   FaIcon(Icons.shopping_cart,
//                                                       color: white),
//                                                 ],
//                                               ),
//                                             ),
//                                           )
//                                         ],
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
//         },
//       ),
//     );
//   }
// }
