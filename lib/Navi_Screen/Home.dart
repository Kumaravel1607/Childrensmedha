import 'dart:convert';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:cmedha/drawer.dart';
import 'package:cmedha/screens/Constant/color.dart';
import 'package:cmedha/screens/widget.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  final String user_name;

  const HomeScreen({Key? key, required this.user_name}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController tabController;
  late ScrollController _scrollController;
  bool isDataLoaded = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<dynamic> categories = [];
  List<dynamic> courses = [];
  List<dynamic> teachers = [];
  List<dynamic> banners = [];
  Map<String, dynamic> about = {};

  @override
  void initState() {
    super.initState();
    fetchData();
    tabController = TabController(length: 2, vsync: this);
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  Future<void> fetchData() async {
    var url = "https://dreams.hashref.org/api/home";
    var urlparse = Uri.parse(url);
    var response = await http.get(urlparse);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        categories = jsonData['category'];
        courses = jsonData['course'];
        teachers = jsonData['teacher'];
        banners = jsonData['banner'];
        about = jsonData['about'];
        isDataLoaded = true;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Blue,
        title: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text20('Hi, ${widget.user_name}', Colors.black),
                text16("Lets Start Learning", Colors.black),
              ],
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Container(
                height: 35,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade200,
                ),
                child: const Center(
                  child: Icon(Icons.sort, size: 35),
                ),
              ),
            ),
          )
        ],
      ),
      key: _scaffoldKey,
      endDrawer: const Drawer(
        child: DrawerScreen(),
      ),
      body: isDataLoaded
          ? ScrollConfiguration(
              behavior: ScrollBehavior(),
              child: SizedBox(
                child: ListView(
                  controller: _scrollController,
                  children: [
                    bannerCarousel(),
                    const SizedBox(height: 10),
                    Column(
                      children: [
                        Text(
                          about['title'].toString(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Html(data: about['about_description'].toString()),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        child: Card(
                          color: greylite,
                          elevation: 2,
                          child: TabBar(
                            controller: tabController,
                            indicatorWeight: 2,
                            indicatorPadding: EdgeInsets.zero,
                            labelPadding: EdgeInsets.zero,
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicator: ShapeDecoration(
                                color: Blue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.all(
                                        new Radius.circular(5)))),
                            unselectedLabelColor: black,
                            labelColor: white,
                            labelStyle: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                            tabs: [
                              Text("Mentors"),
                              Text("Teachers"),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      height: MediaQuery.of(context).size.height * 1,
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          instructorList(instructorType: 1), // Mentors
                          instructorList(instructorType: 2), // Teachers
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Center(
              child: CircularProgressIndicator(
              color: Blue,
            )),
    );
  }

  Widget instructorList({required int instructorType}) {
    List<dynamic> instructors;

    if (instructorType == 1) {
      // Display mentors
      instructors = teachers
          .where((instructor) => instructor['instructor_type'] == 1)
          .toList();
    } else {
      // Display teachers
      instructors = teachers
          .where((instructor) => instructor['instructor_type'] == 2)
          .toList();
    }

    return SizedBox(
      height: 200,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: instructors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 130,
                    width: 120,
                    child: CachedNetworkImage(
                      imageUrl: instructors[index]['instructor_image'],
                      fit: BoxFit.fill,
                      placeholder: (context, url) => Center(
                        child: SizedBox(
                          height: 25,
                          width: 25,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.blue,
                            ),
                            backgroundColor: Colors.white,
                            strokeWidth: 2,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                text16(
                  instructors[index]["instructor_name"],
                  Colors.black,
                ),
                text14(
                  instructors[index]['subject'],
                  Colors.black,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget bannerCarousel() {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 200,
        viewportFraction: 1.0,
        autoPlay: true,
        enableInfiniteScroll: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayCurve: Curves.easeInCubic,
        enlargeCenterPage: false,
        reverse: false,
      ),
      itemCount: banners.length,
      itemBuilder: (context, index, int) {
        if (banners.isEmpty) {
          return Container(); // Return an empty container or placeholder widget
        }

        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {},
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          CachedNetworkImage(
                            imageUrl: banners[index]['banner_image'],
                            fit: BoxFit.fill,
                            placeholder: (context, url) => Center(
                              child: SizedBox(
                                height: 25,
                                width: 25,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.blue),
                                  backgroundColor: Colors.white,
                                  strokeWidth: 2,
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                          Positioned.fill(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                              child: Container(
                                color: Colors.black.withOpacity(0.2),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: 50,
                    child: Text(
                      banners[index]['banner_title'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}








// import 'dart:convert';
// import 'dart:ui';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:cmedha/drawer.dart';
// import 'package:cmedha/screens/Constant/color.dart';
// import 'package:cmedha/screens/widget.dart';
// import 'package:http/http.dart' as http;

// class HomeScreen extends StatefulWidget {
//   final String user_name;

//   const HomeScreen({Key? key, required this.user_name}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
//   late TabController tabController;
//   late ScrollController _scrollController;
//   bool isDataLoaded = false;
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   List<dynamic> categories = [];
//   List<dynamic> courses = [];
//   List<dynamic> teachers = [];
//   List<dynamic> banners = [];
//   Map<String, dynamic> about = {};

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//     tabController = TabController(length: 2, vsync: this);
//     _scrollController = ScrollController();
//   }

//   @override
//   void dispose() {
//     tabController.dispose();
//     super.dispose();
//   }

//   Future<void> fetchData() async {
//     var url = "https://dreams.hashref.org/api/home";
//     var urlparse = Uri.parse(url);
//     var response = await http.get(urlparse);

//     if (response.statusCode == 200) {
//       final jsonData = json.decode(response.body);
//       setState(() {
//         categories = jsonData['category'];
//         courses = jsonData['course'];
//         teachers = jsonData['teacher'];
//         banners = jsonData['banner'];
//         about = jsonData['about'];
//         isDataLoaded = true;
//       });
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Blue,
//           title: Column(
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   text20('Hi, ${widget.user_name}', Colors.black),
//                   text16("Lets Start Learning", Colors.black),
//                 ],
//               ),
//             ],
//           ),
//           actions: [
//             GestureDetector(
//               onTap: () {
//                 _scaffoldKey.currentState?.openEndDrawer();
//               },
//               child: Padding(
//                 padding: const EdgeInsets.only(right: 15),
//                 child: Container(
//                   height: 35,
//                   width: 40,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: Colors.grey.shade200,
//                   ),
//                   child: const Center(
//                     child: Icon(Icons.sort, size: 35),
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//         key: _scaffoldKey,
//         endDrawer: const Drawer(
//           child: DrawerScreen(),
//         ),
//         body: FutureBuilder(
//             future: fetchData(), // Your asynchronous operation
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 // If the Future is still running, show a loading indicator
//                 return CircularProgressIndicator();
//               } else if (snapshot.hasError) {
//                 // If the Future throws an error, display an error message
//                 return Center(child: Text('Error: ${snapshot.error}'));
//               } else {
//                 return ScrollConfiguration(
//                   behavior: ScrollBehavior(),
//                   child: SizedBox(
//                     child: ListView(
//                       controller: isDataLoaded ? _scrollController : null,
//                       children: [
//                         // Container(
//                         //   height: MediaQuery.of(context).size.height / 4.5,
//                         //   width: double.infinity,
//                         //   decoration: const BoxDecoration(
//                         //     color: Colors.blue,
//                         //     borderRadius: BorderRadius.only(
//                         //       bottomLeft: Radius.circular(30),
//                         //       bottomRight: Radius.circular(30),
//                         //     ),
//                         //   ),
//                         //   child: Padding(
//                         //     padding: const EdgeInsets.only(top: 40),
//                         //     child: Column(
//                         //       children: [
//                         //         Padding(
//                         //           padding: const EdgeInsets.symmetric(horizontal: 10),
//                         //           child: Row(
//                         //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         //             children: [],
//                         //           ),
//                         //         ),
//                         //         const SizedBox(height: 30),
//                         //         Row(
//                         //           mainAxisAlignment: MainAxisAlignment.center,
//                         //           children: [
//                         //             SizedBox(
//                         //               height: 40,
//                         //               width: 320,
//                         //               child: Container(
//                         //                 decoration: BoxDecoration(
//                         //                   borderRadius: BorderRadius.circular(10),
//                         //                   color: Colors.grey.shade200,
//                         //                 ),
//                         //                 child: const TextField(
//                         //                   autofocus: false,
//                         //                   decoration: InputDecoration(
//                         //                     hintText: "Search",
//                         //                     contentPadding:
//                         //                         EdgeInsets.fromLTRB(10, 5, 10, 10),
//                         //                     hintStyle: TextStyle(
//                         //                       color: Colors.grey,
//                         //                       fontSize: 16,
//                         //                       fontWeight: FontWeight.w600,
//                         //                     ),
//                         //                     prefixIcon: Icon(
//                         //                       Icons.search,
//                         //                       color: Colors.grey,
//                         //                     ),
//                         //                     border: InputBorder.none,
//                         //                   ),
//                         //                 ),
//                         //               ),
//                         //             ),
//                         //             const SizedBox(width: 20),
//                         //           ],
//                         //         ),
//                         //       ],
//                         //     ),
//                         //   ),
//                         // ),

//                         bannerCarousel(),
//                         const SizedBox(height: 10),
//                         Column(
//                           children: [
//                             Text(
//                               about['title'].toString(),
//                               style: TextStyle(
//                                   fontSize: 20, fontWeight: FontWeight.w600),
//                             ),
//                             // const SizedBox(height: 20),
//                             Html(data: about['about_description'].toString()),
//                           ],
//                         ),
//                         // Padding(
//                         //   padding: const EdgeInsets.symmetric(horizontal: 15),
//                         //   child: Row(
//                         //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         //     children: [
//                         //       text20('Courses', Colors.black),
//                         //       GestureDetector(
//                         //         onTap: () {
//                         //           // Handle View All Courses
//                         //         },
//                         //         child: text16('View all', Colors.blue),
//                         //       ),
//                         //     ],
//                         //   ),
//                         // ),
//                         // const SizedBox(height: 10),
//                         // SizedBox(
//                         //   height: 180,
//                         //   child: ListView.builder(
//                         //     itemCount: courses.length,
//                         //     scrollDirection: Axis.horizontal,
//                         //     itemBuilder: (BuildContext context, int index) {
//                         //       return GestureDetector(
//                         //         onTap: () {
//                         //           // Handle course tap
//                         //         },
//                         //         child: Padding(
//                         //           padding: const EdgeInsets.symmetric(horizontal: 10),
//                         //           child: Column(
//                         //             children: [
//                         //               ClipRRect(
//                         //                 borderRadius: BorderRadius.circular(10),
//                         //                 child: Container(
//                         //                   width: 150,
//                         //                   height: 130,
//                         //                   child: CachedNetworkImage(
//                         //                     imageUrl: courses[index]['course_image'],
//                         //                     fit: BoxFit.cover,
//                         //                     placeholder: (context, url) => Center(
//                         //                       child: SizedBox(
//                         //                         height: 25,
//                         //                         width: 25,
//                         //                         child: CircularProgressIndicator(
//                         //                           valueColor: AlwaysStoppedAnimation<Color>(
//                         //                             Colors.blue,
//                         //                           ),
//                         //                           backgroundColor: Colors.white,
//                         //                           strokeWidth: 2,
//                         //                         ),
//                         //                       ),
//                         //                     ),
//                         //                     errorWidget: (context, url, error) =>
//                         //                         Icon(Icons.error),
//                         //                   ),
//                         //                 ),
//                         //               ),
//                         //               const SizedBox(height: 10),
//                         //               text16(
//                         //                 courses[index]['course_name'],
//                         //                 Colors.black,
//                         //               ),
//                         //             ],
//                         //           ),
//                         //         ),
//                         //       );
//                         //     },
//                         //   ),
//                         // ),
//                         // Padding(
//                         //   padding: const EdgeInsets.symmetric(horizontal: 15),
//                         //   child: Row(
//                         //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         //     children: [
//                         //       text20('Mentors', Colors.black),
//                         //       GestureDetector(
//                         //         onTap: () {
//                         //           // Handle View All Mentors
//                         //         },
//                         //         child: text16('View all', Colors.blue),
//                         //       ),
//                         //     ],
//                         //   ),
//                         // ),
//                         const SizedBox(height: 15),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Container(
//                             height: 50,
//                             child: Card(
//                               color: greylite,
//                               elevation: 2,
//                               // height: 50,
//                               child: TabBar(
//                                 //indicatorPadding: EdgeInsets.all(10),
//                                 controller: tabController,
//                                 indicatorWeight: 2,
//                                 indicatorPadding: EdgeInsets.zero,
//                                 labelPadding: EdgeInsets.zero,
//                                 indicatorSize: TabBarIndicatorSize.tab,
//                                 indicator: ShapeDecoration(
//                                     color: Blue,
//                                     //   shape: StadiumBorder(),
//                                     // ),
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius: new BorderRadius.all(
//                                             new Radius.circular(5)))),
//                                 // color: Color.fromARGB(255, 109, 179, 236)),
//                                 // color: Colors.indigo,
//                                 unselectedLabelColor: black,
//                                 labelColor: white,
//                                 labelStyle: TextStyle(
//                                     fontSize: 14, fontWeight: FontWeight.w500),
//                                 tabs: [
//                                   Text("Mentors"),
//                                   Text("Teachers"),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 15),
//                         Container(
//                           height: MediaQuery.of(context).size.height * 1,
//                           child: TabBarView(
//                             // physics: AlwaysScrollableScrollPhysics(),
//                             controller: tabController,
//                             children: [
//                               instructorList(instructorType: 1), // Mentors
//                               instructorList(instructorType: 2), // Teachers
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               }
//             }));
//   }

//   Widget instructorList({required int instructorType}) {
//     List<dynamic> instructors;

//     if (instructorType == 1) {
//       // Display mentors
//       instructors = teachers
//           .where((instructor) => instructor['instructor_type'] == 1)
//           .toList();
//     } else {
//       // Display teachers
//       instructors = teachers
//           .where((instructor) => instructor['instructor_type'] == 2)
//           .toList();
//     }

//     return SizedBox(
//       height: 200,
//       child: ListView.builder(
//         shrinkWrap: true,
//         itemCount: instructors.length,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (BuildContext context, int index) {
//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             child: Column(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: Container(
//                     height: 130,
//                     width: 120,
//                     child: CachedNetworkImage(
//                       imageUrl: instructors[index]['instructor_image'],
//                       fit: BoxFit.fill,
//                       placeholder: (context, url) => Center(
//                         child: SizedBox(
//                           height: 25,
//                           width: 25,
//                           child: CircularProgressIndicator(
//                             valueColor: AlwaysStoppedAnimation<Color>(
//                               Colors.blue,
//                             ),
//                             backgroundColor: Colors.white,
//                             strokeWidth: 2,
//                           ),
//                         ),
//                       ),
//                       errorWidget: (context, url, error) => Icon(Icons.error),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 text16(
//                   instructors[index]["instructor_name"],
//                   Colors.black,
//                 ),
//                 text14(
//                   instructors[index]['subject'],
//                   Colors.black,
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget bannerCarousel() {
//     return CarouselSlider.builder(
//       options: CarouselOptions(
//         height: 200,
//         viewportFraction: 1.0,
//         autoPlay: true,
//         enableInfiniteScroll: true,
//         autoPlayInterval: Duration(seconds: 3),
//         autoPlayCurve: Curves.easeInCubic,
//         enlargeCenterPage: false,
//         reverse: false,
//       ),
//       itemCount: banners.length,
//       itemBuilder: (context, index, int) {
//         if (banners.isEmpty) {
//           return Container(); // Return an empty container or placeholder widget
//         }

//         return Builder(
//           builder: (BuildContext context) {
//             return GestureDetector(
//               onTap: () {},
//               child: Stack(
//                 fit: StackFit.expand,
//                 children: [
//                   Container(
//                     padding: EdgeInsets.all(10),
//                     width: MediaQuery.of(context).size.width,
//                     height: MediaQuery.of(context).size.height,
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(10),
//                       child: Stack(
//                         fit: StackFit.expand,
//                         children: [
//                           CachedNetworkImage(
//                             imageUrl: banners[index]['banner_image'],
//                             fit: BoxFit.fill,
//                             placeholder: (context, url) => Center(
//                               child: SizedBox(
//                                 height: 25,
//                                 width: 25,
//                                 child: CircularProgressIndicator(
//                                   valueColor: AlwaysStoppedAnimation<Color>(
//                                       Colors.blue),
//                                   backgroundColor: Colors.white,
//                                   strokeWidth: 2,
//                                 ),
//                               ),
//                             ),
//                             errorWidget: (context, url, error) =>
//                                 Icon(Icons.error),
//                           ),
//                           Positioned.fill(
//                             child: BackdropFilter(
//                               filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
//                               child: Container(
//                                 color: Colors.black.withOpacity(0.2),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 100,
//                     left: 50,
//                     child: Text(
//                       banners[index]['banner_title'],
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }

  // Widget instructorList({required int instructorType}) {
  //   List<dynamic> instructors;

  //   if (instructorType == 1) {
  //     // Display mentors
  //     instructors = teachers
  //         .where((instructor) => instructor['instructor_type'] == 1)
  //         .toList();
  //   } else {
  //     // Display teachers
  //     instructors = teachers
  //         .where((instructor) => instructor['instructor_type'] == 2)
  //         .toList();
  //   }

  //   final itemHeight = 120;
  //   return SizedBox(
  //     height: 200,
  //     child: GridView.builder(
  //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //         crossAxisCount: 2, // Set the number of columns
  //         crossAxisSpacing: 10.0, // Set the spacing between columns
  //         mainAxisSpacing: 10.0,
  //         childAspectRatio: 0.9,
  //         // Set the spacing between rows
  //       ),
  //       itemCount: instructors.length,
  //       scrollDirection: Axis.horizontal,
  //       itemBuilder: (BuildContext context, int index) {
  //         return Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 10),
  //           child: Column(
  //             children: [
  //               ClipRRect(
  //                 borderRadius: BorderRadius.circular(10),
  //                 child: Container(
  //                   height: 0.8 * itemHeight,
  //                   width: 100,
  //                   child: CachedNetworkImage(
  //                     imageUrl: instructors[index]['instructor_image'],
  //                     fit: BoxFit.fill,
  //                     placeholder: (context, url) => Center(
  //                       child: SizedBox(
  //                         height: 25,
  //                         width: 25,
  //                         child: CircularProgressIndicator(
  //                           valueColor: AlwaysStoppedAnimation<Color>(
  //                             Colors.blue,
  //                           ),
  //                           backgroundColor: Colors.white,
  //                           strokeWidth: 2,
  //                         ),
  //                       ),
  //                     ),
  //                     errorWidget: (context, url, error) => Icon(Icons.error),
  //                   ),
  //                 ),
  //               ),
  //               const SizedBox(height: 10),
  //               text16(
  //                 instructors[index]["instructor_name"],
  //                 Colors.black,
  //               ),
  //               text14(
  //                 instructors[index]['subject'],
  //                 Colors.black,
  //               ),
  //             ],
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }
 
// class HomeScreen extends StatefulWidget {
//   final String user_name;
//   const HomeScreen({Key? key, required this.user_name}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   _categorylist();
//   //   _courselist();
//   //   _teacherlist();
//   // }

//   // // ... (rest of your code)

//   // // Home_Category api data
//   // List<HomeCategory> category = [];
//   // bool isCategoryLoading = true;

//   // _categorylist() async {
//   //   SharedPreferences session = await SharedPreferences.getInstance();
//   //   var id = session.getInt('id');
//   //   RemoteService.HomeCategorydata().then((results) {
//   //     setState(() {
//   //       isCategoryLoading = false;
//   //       category = results;
//   //     });
//   //   });
//   // }

//   // // HomeCourse
//   // List<HomeCourse> course = [];
//   // bool isCourseLoading = true;

//   // _courselist() async {
//   //   SharedPreferences session = await SharedPreferences.getInstance();
//   //   var id = session.getInt('id');
//   //   RemoteService.HomeCoursedata().then((result) {
//   //     setState(() {
//   //       isCourseLoading = false;
//   //       course = result;
//   //     });
//   //   });
//   // }

//   // // HomeTeacher
//   // List<HomeTeacher> teacher = [];
//   // bool isTeacherLoading = true;

//   // _teacherlist() async {
//   //   SharedPreferences session = await SharedPreferences.getInstance();
//   //   var id = session.getInt('id');
//   //   RemoteService.HomeTeacherdata().then((result) {
//   //     setState(() {
//   //       isTeacherLoading = false;
//   //       teacher = result;
//   //     });
//   //   });
//   // }

//   List<dynamic> categories = [];
//   List<dynamic> courses = [];
//   List<dynamic> teachers = [];
//   List<dynamic> banners = [];
//   Map<String, dynamic> about = {};
//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   Future<void> fetchData() async {
//     var url = "https://dreams.hashref.org/api/home";
//     var urlparse = Uri.parse(url);
//     var response = await http.get(
//       urlparse,
//     );

//     if (response.statusCode == 200) {
//       final jsonData = json.decode(response.body);
//       setState(() {
//         categories = jsonData['category'];
//         courses = jsonData['course'];
//         teachers = jsonData['teacher'];
//         banners = jsonData['banner'];
//         about = jsonData['about'];
//       });
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       endDrawer: const Drawer(
//         child: DrawerScreen(),
//       ),
//       body: SingleChildScrollView(
//         child: SizedBox(
//           height: MediaQuery.of(context).size.height,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 height: MediaQuery.of(context).size.height / 4.5,
//                 width: double.infinity,
//                 decoration: const BoxDecoration(
//                     color: Blue,
//                     borderRadius: BorderRadius.only(
//                         bottomLeft: Radius.circular(30),
//                         bottomRight: Radius.circular(30))),
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 40),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 10),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 text20('Hi, ${widget.user_name}', Colors.black),
//                                 text16("Lets Start Learning", Colors.white),
//                               ],
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 _scaffoldKey.currentState?.openEndDrawer();
//                               },
//                               child: Container(
//                                 height: 40,
//                                 width: 45,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(10),
//                                     color: Colors.grey.shade200),
//                                 child: const Center(
//                                     child: FaIcon(Icons.sort, size: 35)),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),

//                       // Row(
//                       //   children: [Text('data'), Icon(Icons.abc)],
//                       // ),
//                       const SizedBox(
//                         height: 30,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SizedBox(
//                             height: 40,
//                             width: 320,
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(10),
//                                   color: Colors.grey.shade200),
//                               child: const TextField(
//                                 autofocus: false,
//                                 decoration: InputDecoration(
//                                   hintText: "Search",
//                                   contentPadding:
//                                       EdgeInsets.fromLTRB(10, 5, 10, 10),
//                                   hintStyle: TextStyle(
//                                       color: Colors.grey,
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600),
//                                   prefixIcon: Icon(
//                                     Icons.search,
//                                     color: Colors.grey,
//                                   ),
//                                   border: InputBorder.none,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 20,
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               bannerCarousel(),
//               // BannerWidget(),
//               // Padding(
//               //   padding: const EdgeInsets.symmetric(horizontal: 15),
//               //   child: text20('Categories', Colors.black),
//               // ),
//               // const SizedBox(height: 20),
//               // SizedBox(
//               //   height: 110,
//               //   child: GestureDetector(
//               //     onTap: () {
//               //       // Navigator.of(context).pushAndRemoveUntil(
//               //       //     MaterialPageRoute(
//               //       //         builder: (BuildContext context) => CourseScreen()),
//               //       //     (Route<dynamic> route) => true);
//               //     },
//               //     child: ListView.builder(
//               //       shrinkWrap: true,
//               //       itemCount: categories.length,
//               //       // itemCount: Data.length,
//               //       scrollDirection: Axis.horizontal,
//               //       itemBuilder: (BuildContext context, int index) {
//               //         return GestureDetector(
//               //           onTap: () {
//               //             // Navigator.push(
//               //             //     context,
//               //             //     MaterialPageRoute(
//               //             //         builder: (context) => CourseScreen(),
//               //             //         settings: RouteSettings(name: "/course")));
//               //             // Navigator.popUntil(context,
//               //             //     (route) => route.settings.name == "/course");
//               //             Navigator.of(context).pushAndRemoveUntil(
//               //                 MaterialPageRoute(
//               //                     builder: (BuildContext context) =>
//               //                         CourseDetailPage(
//               //                             id: categories[index]
//               //                                 ['category_id'])),
//               //                 (Route<dynamic> route) => true);
//               //           },
//               //           child: Padding(
//               //             padding: const EdgeInsets.symmetric(horizontal: 10),
//               //             child: Column(
//               //               children: [
//               //                 SizedBox(
//               //                   height: 70,
//               //                   width: 70,
//               //                   child: CircleAvatar(
//               //                     child: Container(
//               //                       decoration: BoxDecoration(
//               //                         shape: BoxShape.circle,
//               //                       ),
//               //                       child: CachedNetworkImage(
//               //                         fadeInCurve: Curves.bounceIn,
//               //                         imageUrl: categories[index]
//               //                             ['category_image'],
//               //                         imageBuilder: (context, imageProvider) =>
//               //                             Container(
//               //                           decoration: BoxDecoration(
//               //                             shape: BoxShape.circle,
//               //                             image: DecorationImage(
//               //                               image: imageProvider,
//               //                               fit: BoxFit.cover,
//               //                             ),
//               //                           ),
//               //                         ),
//               //                         placeholder: (context, url) => Center(
//               //                             child: SizedBox(
//               //                                 height: 25,
//               //                                 width: 25,
//               //                                 child: CircularProgressIndicator(
//               //                                   valueColor:
//               //                                       AlwaysStoppedAnimation<
//               //                                           Color>(Blue),
//               //                                   backgroundColor: Colors.white,
//               //                                   strokeWidth: 2,
//               //                                 ))),
//               //                         errorWidget: (context, url, error) =>
//               //                             Icon(Icons.error),
//               //                       ),
//               //                     ),
//               //                   ),
//               //                 ),
//               //                 const SizedBox(
//               //                   height: 10,
//               //                 ),
//               //                 text16(
//               //                     categories[index]["category_name"],
//               //                     // Data[index].name,
//               //                     Colors.black
//               //                     // 'English'

//               //                     )
//               //               ],
//               //             ),
//               //           ),
//               //         );
//               //       },
//               //     ),
//               //   ),
//               // ),

//               const SizedBox(height: 20),
//               Column(
//                 children: [
//                   text20(about['title'].toString(), black),
//                   const SizedBox(height: 20),
//                   Html(data: about['about_description'].toString())
//                 ],
//               ),

//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     text20('Courses', black),
//                     GestureDetector(
//                       onTap: () {
//                         // Navigator.of(context).pushAndRemoveUntil(
//                         //     MaterialPageRoute(
//                         //         builder: (BuildContext context) =>
//                         //             CourseDetailPage(
//                         //               id: null,
//                         //             )),
//                         //     (Route<dynamic> route) => true);
//                       },
//                       child: text16('View all', Blue),
//                     )
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Flexible(
//                 child: SizedBox(
//                   height: 180,
//                   child: ListView.builder(
//                     itemCount: courses.length,
//                     //itemCount: CourseData.length,
//                     scrollDirection: Axis.horizontal,
//                     itemBuilder: (BuildContext context, int index) {
//                       return GestureDetector(
//                         onTap: () {
//                           Navigator.of(context).pushAndRemoveUntil(
//                               MaterialPageRoute(
//                                   builder: (BuildContext context) =>
//                                       CourseDetailPage(
//                                         id: courses[index]['id'].toString(),
//                                       )),
//                               (Route<dynamic> route) => true);
//                         },
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 10),
//                           child: Column(
//                             children: [
//                               ClipRRect(
//                                 borderRadius: BorderRadius.circular(10),
//                                 child: Container(
//                                   width: 150,
//                                   height: 130,
//                                   child: CachedNetworkImage(
//                                     imageUrl: courses[index]['course_image'],
//                                     fit: BoxFit.cover,
//                                     placeholder: (context, url) => Center(
//                                         child: SizedBox(
//                                             height: 25,
//                                             width: 25,
//                                             child: CircularProgressIndicator(
//                                               valueColor:
//                                                   AlwaysStoppedAnimation<Color>(
//                                                       Blue),
//                                               backgroundColor: Colors.white,
//                                               strokeWidth: 2,
//                                             ))),
//                                     // Placeholder widget while loading
//                                     errorWidget: (context, url, error) =>
//                                         Icon(Icons.error),
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               text16(
//                                   courses[index]['course_name'],
//                                   // CourseData[index].name,
//                                   Colors.black
//                                   // 'English'

//                                   )
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//               // ... (rest of your code)
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     text20('Mentors', black),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.of(context).pushAndRemoveUntil(
//                             MaterialPageRoute(
//                                 builder: (BuildContext context) =>
//                                     CourseScreen()),
//                             (Route<dynamic> route) => false);
//                       },
//                       child: text16('View all', Blue),
//                     )
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               Expanded(
//                 child: ListView.builder(
//                   // itemCount: MentorData.length,
//                   itemCount: teachers.length,
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10),
//                       child: Column(
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(10),
//                             child: Container(
//                               height: 120,
//                               width: 100,
//                               child: CachedNetworkImage(
//                                 imageUrl: teachers[index]['instructor_image'],
//                                 fit: BoxFit.fill,
//                                 placeholder: (context, url) => Center(
//                                     child: SizedBox(
//                                         height: 25,
//                                         width: 25,
//                                         child: CircularProgressIndicator(
//                                           valueColor:
//                                               AlwaysStoppedAnimation<Color>(
//                                                   Blue),
//                                           backgroundColor: Colors.white,
//                                           strokeWidth: 2,
//                                         ))), // Placeholder widget while loading
//                                 errorWidget: (context, url, error) =>
//                                     Icon(Icons.error),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           text16(
//                               teachers[index]["instructor_name"],
//                               //MentorData[index].name,
//                               Colors.black
//                               // 'English'

//                               ),
//                           text14(
//                               teachers[index]['subject'],
//                               //MentorData[index].subject,
//                               Colors.black
//                               // 'English'

//                               )
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

// import 'dart:ui';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:cmedha/Api/Api_services/Remote_services.dart';
// import 'package:cmedha/Models/home_cat_model.dart';
// import 'package:cmedha/Models/home_course.dart';
// import 'package:cmedha/Models/home_teacher_model.dart';
// import 'package:cmedha/Navigation.dart';
// import 'package:cmedha/drawer.dart';
// import 'package:cmedha/screens/Constant/color.dart';
// import 'package:cmedha/Navi_Screen/Course.dart';
// import 'package:cmedha/screens/Courses/CourseDetail.dart';
// import 'package:cmedha/screens/widget.dart';
// //import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class HomeScreen extends StatefulWidget {
//   final String user_name;
//   const HomeScreen({super.key, required this.user_name});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class cat {
//   final String name;
//   final String image;

//   cat({required this.name, required this.image});
// }

// class Mentor {
//   final String name;
//   final String subject;
//   final String image;

//   final bool isFavorite;

//   Mentor(
//       {required this.image,
//       required this.name,
//       this.isFavorite = false,
//       required this.subject});

//   Mentor copyWith({String? name, bool? isFavorite}) => Mentor(
//       name: name ?? this.name,
//       isFavorite: isFavorite ?? this.isFavorite,
//       image: '',
//       subject: '');
// }

// final List<Mentor> MentorData = [
//   Mentor(
//       image: "assets/images/teacher1.jpg",
//       subject: 'Mathematics',
//       name: 'Ioan Drozd'),
//   Mentor(
//       image: 'assets/images/teacher3.jpg',
//       subject: 'Intelligence',
//       name: 'Emma Harper'),
//   Mentor(
//       image: 'assets/images/teacher2.jpg',
//       subject: 'Intelligence ',
//       name: 'Ava Madison'),
//   Mentor(
//       image: 'assets/images/teacher4.jpg',
//       subject: 'Intelligence',
//       name: 'Sophia'),
// ];

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

// final _scaffoldKey = GlobalKey<ScaffoldState>();

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   void initState() {
//     super.initState();

//     _categorylist();
//     _courselist();
//     _teacherlist();
//   }

//   final List<cat> Data = [
//     cat(name: "English", image: 'assets/images/course1.png'),
//     cat(name: "Maths", image: 'assets/images/course2.png'),
//     cat(name: "Science", image: 'assets/images/course3.png'),
//     cat(name: "Verbal", image: 'assets/images/course1.png'),
//     cat(name: "Reasoning", image: 'assets/images/course2.png'),
//     cat(name: "6th", image: 'assets/images/course3.png'),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       //appBar: AppBar(),
//       endDrawer: const Drawer(
//         child: DrawerScreen(),
//       ),
//       body: SingleChildScrollView(
//         child: SizedBox(
//           height: MediaQuery.of(context).size.height,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 height: MediaQuery.of(context).size.height / 4.5,
//                 width: double.infinity,
//                 decoration: const BoxDecoration(
//                     color: Blue,
//                     borderRadius: BorderRadius.only(
//                         bottomLeft: Radius.circular(30),
//                         bottomRight: Radius.circular(30))),
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 40),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 10),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 text20('Hi, ${widget.user_name}', Colors.black),
//                                 text16("Lets Start Learning", Colors.white),
//                               ],
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 _scaffoldKey.currentState?.openEndDrawer();
//                               },
//                               child: Container(
//                                 height: 40,
//                                 width: 45,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(10),
//                                     color: Colors.grey.shade200),
//                                 child: const Center(
//                                     child: FaIcon(Icons.sort, size: 35)),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),

//                       // Row(
//                       //   children: [Text('data'), Icon(Icons.abc)],
//                       // ),
//                       const SizedBox(
//                         height: 30,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SizedBox(
//                             height: 40,
//                             width: 320,
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(10),
//                                   color: Colors.grey.shade200),
//                               child: const TextField(
//                                 autofocus: false,
//                                 decoration: InputDecoration(
//                                   hintText: "Search",
//                                   contentPadding:
//                                       EdgeInsets.fromLTRB(10, 5, 10, 10),
//                                   hintStyle: TextStyle(
//                                       color: Colors.grey,
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600),
//                                   prefixIcon: Icon(
//                                     Icons.search,
//                                     color: Colors.grey,
//                                   ),
//                                   border: InputBorder.none,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 20,
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15),
//                 child: text20('Categories', Colors.black),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               SizedBox(
//                 height: 110,
//                 child: GestureDetector(
//                   onTap: () {
//                     // Navigator.of(context).pushAndRemoveUntil(
//                     //     MaterialPageRoute(
//                     //         builder: (BuildContext context) => CourseScreen()),
//                     //     (Route<dynamic> route) => true);
//                   },
//                   child: ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: category.length,
//                     // itemCount: Data.length,
//                     scrollDirection: Axis.horizontal,
//                     itemBuilder: (BuildContext context, int index) {
//                       return GestureDetector(
//                         onTap: () {
//                           // Navigator.push(
//                           //     context,
//                           //     MaterialPageRoute(
//                           //         builder: (context) => CourseScreen(),
//                           //         settings: RouteSettings(name: "/course")));
//                           // Navigator.popUntil(context,
//                           //     (route) => route.settings.name == "/course");
//                           Navigator.of(context).pushAndRemoveUntil(
//                               MaterialPageRoute(
//                                   builder: (BuildContext context) =>
//                                       CourseDetailPage()),
//                               (Route<dynamic> route) => true);
//                         },
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 10),
//                           child: Column(
//                             children: [
//                               SizedBox(
//                                   // decoration: BoxDecoration(
//                                   //     borderRadius: BorderRadius.circular(10),
//                                   //     border: Border.all(color: Colors.grey[300]!)),
//                                   height: 70,
//                                   width: 70,
//                                   child: CircleAvatar(
//                                     //  radius: 70,
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                         borderRadius:
//                                             BorderRadius.circular(100),
//                                         image: DecorationImage(
//                                           image: NetworkImage(
//                                             category[index].image,
//                                           ),

//                                           // image: AssetImage(
//                                           //   'assets/images/car02.jpeg',
//                                           // ),
//                                           fit: BoxFit.fill,
//                                         ),
//                                       ),
//                                     ),
//                                   )),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               text16(
//                                   category[index].categoryName,
//                                   // Data[index].name,
//                                   Colors.black
//                                   // 'English'

//                                   )
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),

//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     text20('Courses', black),
//                     GestureDetector(
//                       onTap: () {
//                         // Navigator.push(
//                         //     context,
//                         //     MaterialPageRoute(
//                         //         builder: (context) => Navigation(
//                         //               index: 2,
//                         //             )));
//                         Navigator.of(context).pushAndRemoveUntil(
//                             MaterialPageRoute(
//                                 builder: (BuildContext context) =>
//                                     CourseDetailPage()),
//                             (Route<dynamic> route) => true);
//                       },
//                       child: text16('View all', Blue),
//                     )
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Flexible(
//                 child: SizedBox(
//                   height: 180,
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.of(context).pushAndRemoveUntil(
//                           MaterialPageRoute(
//                               builder: (BuildContext context) =>
//                                   CourseDetailPage()),
//                           (Route<dynamic> route) => true);
//                       // Navigator.of(context).pushReplacement(
//                       //     new MaterialPageRoute(
//                       //         builder: (context) => CourseDetailPage()));
//                     },
//                     child: ListView.builder(
//                       itemCount: course.length,
//                       //itemCount: CourseData.length,
//                       scrollDirection: Axis.horizontal,
//                       itemBuilder: (BuildContext context, int index) {
//                         return Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 10),
//                           child: Column(
//                             children: [
//                               ClipRRect(
//                                 borderRadius: BorderRadius.circular(10),
//                                 // decoration: BoxDecoration(
//                                 //     borderRadius: BorderRadius.circular(10),
//                                 //     border: Border.all(color: Colors.grey[300]!)),
//                                 // height: 100,
//                                 // width: 100,
//                                 child: Container(
//                                   width: 150,
//                                   height: 130,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(5),
//                                     image: DecorationImage(
//                                       image: NetworkImage(
//                                         course[index].courseImage,
//                                       ),

//                                       // image: AssetImage(
//                                       //   'assets/images/car02.jpeg',
//                                       // ),
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               //  Image.network(
//                               //   course[index].courseImage,
//                               //   // CourseData[index].image,
//                               //   // "assets/images/course${index + 1}.png",
//                               //   width: 150,
//                               //   height: 130,
//                               //   fit: BoxFit.fill,
//                               // )),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               text16(
//                                   course[index].courseName,
//                                   // CourseData[index].name,
//                                   Colors.black
//                                   // 'English'

//                                   )
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//               // SizedBox(height: 20),

//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     text20('Mentors', black),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.of(context).pushAndRemoveUntil(
//                             MaterialPageRoute(
//                                 builder: (BuildContext context) =>
//                                     CourseScreen()),
//                             (Route<dynamic> route) => false);
//                       },
//                       child: text16('View all', Blue),
//                     )
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               Expanded(
//                 child: ListView.builder(
//                   // itemCount: MentorData.length,
//                   itemCount: teacher.length,
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10),
//                       child: Column(
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(10),
//                             child: Container(
//                               height: 120,
//                               width: 100,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(5),
//                                 image: DecorationImage(
//                                   image: NetworkImage(
//                                     teacher[index].instructorImage,
//                                   ),

//                                   // image: AssetImage(
//                                   //   'assets/images/car02.jpeg',
//                                   // ),
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                             //  Image.network(
//                             //   teacher[index].instructorImage,
//                             //   // MentorData[index].image,
//                             //   // "assets/images/course${index + 1}.png",
//                             //   width: 100,
//                             //   height: 120,
//                             //   fit: BoxFit.fill,
//                             // ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           text16(
//                               teacher[index].instructorName,
//                               //MentorData[index].name,
//                               Colors.black
//                               // 'English'

//                               ),
//                           text14(
//                               teacher[index].subject,
//                               //MentorData[index].subject,
//                               Colors.black
//                               // 'English'

//                               )
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

// ////Home_Category api data

//   List<HomeCategory> category = [];
//   bool isloading = true;
//   _categorylist() async {
//     SharedPreferences session = await SharedPreferences.getInstance();
//     print("--------");
//     var id = session.getInt('id');
//     print("--------");
//     RemoteService.HomeCategorydata().then((results) {
//       setState(() {
//         isloading = false;
//         category = results;
//       });
//     });
//   }

// ///////HomeCourse

//   List<HomeCourse> course = [];

//   _courselist() async {
//     SharedPreferences session = await SharedPreferences.getInstance();
//     print("--------");
//     var id = session.getInt('id');
//     print("--------");
//     RemoteService.HomeCoursedata().then((result) {
//       setState(() {
//         isloading = false;
//         course = result;
//       });
//     });
//   }

//   //////HomeTeacher

//   List<HomeTeacher> teacher = [];

//   _teacherlist() async {
//     SharedPreferences session = await SharedPreferences.getInstance();
//     print("--------");
//     var id = session.getInt('id');
//     print("--------");
//     RemoteService.HomeTeacherdata().then((result) {
//       setState(() {
//         isloading = false;
//         teacher = result;
//       });
//     });
//   }
// }

//   // List<Pic> bannerdata = [
//   //   Pic(image: 'assets/images/bg.jpg'),
//   //   Pic(image: 'assets/images/bg1.jpg'),
//   //   Pic(image: 'assets/images/img3.jpg'),
//   // ];
//   // Widget banner_carousel() =>
//   //     //{ return
//   //     //  banner.length != 0
//   //     //     ?

//   //     CarouselSlider.builder(
//   //         options: CarouselOptions(
//   //           height: 200,
//   //           viewportFraction: 1.0,
//   //           // aspectRatio: 2.0,
//   //           autoPlay: true,
//   //           enableInfiniteScroll: true,
//   //           autoPlayInterval: const Duration(seconds: 3),
//   //           autoPlayCurve: Curves.easeInCubic,
//   //           enlargeCenterPage: false,
//   //           reverse: false,
//   //         ),
//   //         itemCount: bannerdata.length,
//   //         itemBuilder: (context, index, int) {
//   //           return Builder(
//   //             builder: (BuildContext context) {
//   //               return GestureDetector(
//   //                   onTap: () {},
//   //                   child: Container(
//   //                     padding: const EdgeInsets.all(10),
//   //                     width: MediaQuery.of(context).size.width,
//   //                     height: MediaQuery.of(context).size.height,
//   //                     margin: const EdgeInsets.symmetric(horizontal: 5),
//   //                     decoration: BoxDecoration(
//   //                       // color: Colors.grey[300],
//   //                       color: black,
//   //                       borderRadius: BorderRadius.circular(15),
//   //                       image: DecorationImage(
//   //                         colorFilter: ColorFilter.mode(
//   //                             Colors.black.withOpacity(0.5), BlendMode.dstATop),
//   //                         image: AssetImage(bannerdata[index].image.toString()),
//   //                         fit: BoxFit.cover,
//   //                       ),
//   //                       shape: BoxShape.rectangle,
//   //                     ),
//   //                     child: const Stack(
//   //                       children: [
//   //                         Positioned(
//   //                           top: 50,
//   //                           left: 70,
//   //                           child: Text(
//   //                             "Your Child's future is \n         our priority ",
//   //                             style: TextStyle(
//   //                                 fontSize: 20,
//   //                                 color: white,
//   //                                 fontWeight: FontWeight.w600),
//   //                           ),
//   //                         )
//   //                       ],
//   //                     ),
//   //                   ));
//   //             },
//   //           );
// //   //         });
// // }

// // class Pic {
// //   final String image;

// //   Pic({required this.image});
// // }
