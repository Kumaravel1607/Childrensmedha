import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cmedha/Navigation.dart';
import 'package:cmedha/drawer.dart';
import 'package:cmedha/screens/Constant/color.dart';
import 'package:cmedha/Navi_Screen/Course.dart';
import 'package:cmedha/screens/Courses/CourseDetail.dart';
import 'package:cmedha/screens/widget.dart';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class cat {
  final String name;
  final String image;

  cat({required this.name, required this.image});
}

class Mentor {
  final String name;
  final String subject;
  final String image;

  final bool isFavorite;

  Mentor(
      {required this.image,
      required this.name,
      this.isFavorite = false,
      required this.subject});

  Mentor copyWith({String? name, bool? isFavorite}) => Mentor(
      name: name ?? this.name,
      isFavorite: isFavorite ?? this.isFavorite,
      image: '',
      subject: '');
}

final List<Mentor> MentorData = [
  Mentor(
      image: "assets/images/teacher1.jpg",
      subject: 'Mathematics',
      name: 'Ioan Drozd'),
  Mentor(
      image: 'assets/images/teacher3.jpg',
      subject: 'Intelligence',
      name: 'Emma Harper'),
  Mentor(
      image: 'assets/images/teacher2.jpg',
      subject: 'Intelligence ',
      name: 'Ava Madison'),
  Mentor(
      image: 'assets/images/teacher4.jpg',
      subject: 'Intelligence',
      name: 'Sophia'),
];

class Course {
  final String name;
  final String image;

  final bool isFavorite;

  Course({required this.image, required this.name, this.isFavorite = false});

  Course copyWith({String? name, bool? isFavorite}) => Course(
      name: name ?? this.name,
      isFavorite: isFavorite ?? this.isFavorite,
      image: '');
}

final List<Course> CourseData = [
  Course(image: "assets/images/course1.jpg", name: 'Mathematics'),
  Course(image: 'assets/images/course3.jpg', name: 'Intelligence'),
  Course(image: 'assets/images/course2.jpg', name: 'English'),
  Course(image: 'assets/images/course4.jpg', name: 'General'),
];

final _scaffoldKey = GlobalKey<ScaffoldState>();

class _HomeScreenState extends State<HomeScreen> {
  final List<cat> Data = [
    cat(name: "English", image: 'assets/images/course1.png'),
    cat(name: "Maths", image: 'assets/images/course2.png'),
    cat(name: "Science", image: 'assets/images/course3.png'),
    cat(name: "Verbal", image: 'assets/images/course1.png'),
    cat(name: "Reasoning", image: 'assets/images/course2.png'),
    cat(name: "6th", image: 'assets/images/course3.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      //appBar: AppBar(),
      endDrawer: const Drawer(
        child: DrawerScreen(),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 4.5,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Blue,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                text20('Hi, John', Colors.black),
                                text16("Lets Start Learning", Colors.white),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                _scaffoldKey.currentState?.openEndDrawer();
                              },
                              child: Container(
                                height: 40,
                                width: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.shade200),
                                child: const Center(
                                    child: FaIcon(Icons.sort, size: 35)),
                              ),
                            )
                          ],
                        ),
                      ),

                      // Row(
                      //   children: [Text('data'), Icon(Icons.abc)],
                      // ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 40,
                            width: 320,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade200),
                              child: const TextField(
                                autofocus: false,
                                decoration: InputDecoration(
                                  hintText: "Search",
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10, 5, 10, 10),
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.grey,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: text20('Categories', Colors.black),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 110,
                child: GestureDetector(
                  onTap: () {
                    // Navigator.of(context).pushAndRemoveUntil(
                    //     MaterialPageRoute(
                    //         builder: (BuildContext context) => CourseScreen()),
                    //     (Route<dynamic> route) => true);
                  },
                  child: ListView.builder(
                    itemCount: Data.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => CourseScreen(),
                          //         settings: RouteSettings(name: "/course")));
                          // Navigator.popUntil(context,
                          //     (route) => route.settings.name == "/course");
                          // Navigator.of(context).pushAndRemoveUntil(
                          //     MaterialPageRoute(
                          //         builder: (BuildContext context) =>
                          //             CourseScreen()),
                          //     (Route<dynamic> route) => true);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              SizedBox(
                                  // decoration: BoxDecoration(
                                  //     borderRadius: BorderRadius.circular(10),
                                  //     border: Border.all(color: Colors.grey[300]!)),
                                  height: 70,
                                  width: 70,
                                  child: Image.asset(
                                    Data[index].image,
                                    // "assets/images/course${index + 1}.png",
                                    width: 70,
                                    height: 70,
                                    fit: BoxFit.fill,
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              text16(Data[index].name, Colors.black
                                  // 'English'

                                  )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: banner_carousel(),
              // )
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    text20('Courses', black),
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => Navigation(
                        //               index: 2,
                        //             )));
                        Navigator.of(context).pushReplacement(
                            new MaterialPageRoute(
                                builder: (context) => CourseScreen()));
                      },
                      child: text16('View all', Blue),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Flexible(
                child: SizedBox(
                  height: 180,
                  child: ListView.builder(
                    itemCount: CourseData.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                // decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.circular(10),
                                //     border: Border.all(color: Colors.grey[300]!)),
                                // height: 100,
                                // width: 100,
                                child: Image.asset(
                                  CourseData[index].image,
                                  // "assets/images/course${index + 1}.png",
                                  width: 150,
                                  height: 130,
                                  fit: BoxFit.fill,
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            text16(CourseData[index].name, Colors.black
                                // 'English'

                                )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              // SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    text20('Mentors', black),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    CourseScreen()),
                            (Route<dynamic> route) => false);
                      },
                      child: text16('View all', Blue),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: MentorData.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                MentorData[index].image,
                                // "assets/images/course${index + 1}.png",
                                width: 100,
                                height: 120,
                                fit: BoxFit.fill,
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          text16(MentorData[index].name, Colors.black
                              // 'English'

                              ),
                          text14(MentorData[index].subject, Colors.black
                              // 'English'

                              )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Pic> bannerdata = [
    Pic(image: 'assets/images/bg.jpg'),
    Pic(image: 'assets/images/bg1.jpg'),
    Pic(image: 'assets/images/img3.jpg'),
  ];
  Widget banner_carousel() =>
      //{ return
      //  banner.length != 0
      //     ?

      CarouselSlider.builder(
          options: CarouselOptions(
            height: 200,
            viewportFraction: 1.0,
            // aspectRatio: 2.0,
            autoPlay: true,
            enableInfiniteScroll: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayCurve: Curves.easeInCubic,
            enlargeCenterPage: false,
            reverse: false,
          ),
          itemCount: bannerdata.length,
          itemBuilder: (context, index, int) {
            return Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        // color: Colors.grey[300],
                        color: black,
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.5), BlendMode.dstATop),
                          image: AssetImage(bannerdata[index].image.toString()),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.rectangle,
                      ),
                      child: const Stack(
                        children: [
                          Positioned(
                            top: 50,
                            left: 70,
                            child: Text(
                              "Your Child's future is \n         our priority ",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: white,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                    ));
              },
            );
          });
}

class Pic {
  final String image;

  Pic({required this.image});
}








// import 'dart:ui';

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:cmedha/drawer.dart';
// import 'package:cmedha/screens/Constant/color.dart';
// import 'package:cmedha/screens/widget.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class cat {
//   final String name;
//   final String image;

//   cat({required this.name, required this.image});
// }

// final _scaffoldKey = GlobalKey<ScaffoldState>();

// class _HomeScreenState extends State<HomeScreen> {
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
//       endDrawer: Drawer(
//         child: DrawerScreen(),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             height: 80,
//             //height: MediaQuery.of(context).size.height / 5,
//             width: double.infinity,
//             decoration: BoxDecoration(
//                 boxShadow: [
//                   new BoxShadow(
//                     color: Colors.black,
//                     blurRadius: 5,
//                   ),
//                 ],
//                 color: Blue,
//                 borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(25),
//                     bottomRight: Radius.circular(25))),
//             child: Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 25),
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               text20('Hi,John', Colors.black),
//                               text16("Lets Start Learning", Colors.white),
//                             ],
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               _scaffoldKey.currentState?.openEndDrawer();
//                             },
//                             child: Container(
//                               height: 40,
//                               width: 50,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(10),
//                                   color: Colors.grey.shade200),
//                               child:
//                                   Center(child: FaIcon(Icons.sort, size: 40)),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),

//                     // Row(
//                     //   children: [Text('data'), Icon(Icons.abc)],
//                     // ),
//                     // SizedBox(
//                     //   height: 20,
//                     // ),
//                     // Row(
//                     //   mainAxisAlignment: MainAxisAlignment.center,
//                     //   children: [
//                     //     SizedBox(
//                     //       height: 40,
//                     //       width: 320,
//                     //       child: Container(
//                     //         decoration: BoxDecoration(
//                     //             borderRadius: BorderRadius.circular(10),
//                     //             color: Colors.grey.shade200),
//                     //         child: TextField(
//                     //           autofocus: false,
//                     //           decoration: InputDecoration(
//                     //             hintText: "Search",
//                     //             contentPadding:
//                     //                 EdgeInsets.fromLTRB(10, 5, 10, 10),
//                     //             hintStyle: TextStyle(
//                     //                 color: Colors.grey,
//                     //                 fontSize: 16,
//                     //                 fontWeight: FontWeight.w600),
//                     //             prefixIcon: Icon(
//                     //               Icons.search,
//                     //               color: Colors.grey,
//                     //             ),
//                     //             border: InputBorder.none,
//                     //           ),
//                     //         ),
//                     //       ),
//                     //     ),
//                     //   ],
//                     // ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: banner_carousel(),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 15),
//             child: text20('Categories', Colors.black),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Container(
//             height: 110,
//             child: ListView.builder(
//               itemCount: Data.length,
//               scrollDirection: Axis.horizontal,
//               itemBuilder: (BuildContext context, int index) {
//                 return Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 10),
//                   child: Column(
//                     children: [
//                       Container(
//                           // decoration: BoxDecoration(
//                           //     borderRadius: BorderRadius.circular(10),
//                           //     border: Border.all(color: Colors.grey[300]!)),
//                           height: 70,
//                           width: 70,
//                           child: Image.asset(
//                             Data[index].image,
//                             // "assets/images/course${index + 1}.png",
//                             width: 70,
//                             height: 70,
//                             fit: BoxFit.fill,
//                           )),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       text16(Data[index].name, Colors.black
//                           // 'English'

//                           )
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//           SizedBox(height: 10),
//         ],
//       ),
//     );
//   }

//   List<Pic> bannerdata = [
//     Pic(image: 'assets/images/bg.jpg'),
//     Pic(image: 'assets/images/bg1.jpg'),
//     Pic(image: 'assets/images/img3.jpg'),
//   ];
//   Widget banner_carousel() =>
//       //{ return
//       //  banner.length != 0
//       //     ?

//       new Container(
//         // height: MediaQuery.of(context).size.height / 2,
//         child: CarouselSlider.builder(
//             options: CarouselOptions(
//               height: 200,
//               viewportFraction: 1.0,
//               // aspectRatio: 2.0,
//               autoPlay: true,
//               enableInfiniteScroll: true,
//               autoPlayInterval: Duration(seconds: 3),
//               autoPlayCurve: Curves.easeInCubic,
//               enlargeCenterPage: false,
//               reverse: false,
//             ),
//             itemCount: bannerdata.length,
//             itemBuilder: (context, index, int) {
//               return Builder(
//                 builder: (BuildContext context) {
//                   return GestureDetector(
//                       onTap: () {},
//                       child: Container(
//                         padding: EdgeInsets.all(10),
//                         width: MediaQuery.of(context).size.width,
//                         height: MediaQuery.of(context).size.height,
//                         margin: const EdgeInsets.symmetric(horizontal: 5),
//                         decoration: BoxDecoration(
//                           // color: Colors.grey[300],
//                           color: black,
//                           borderRadius: BorderRadius.circular(15),
//                           image: DecorationImage(
//                             colorFilter: new ColorFilter.mode(
//                                 Colors.black.withOpacity(0.5),
//                                 BlendMode.dstATop),
//                             image:
//                                 AssetImage(bannerdata[index].image.toString()),
//                             fit: BoxFit.cover,
//                           ),
//                           shape: BoxShape.rectangle,
//                         ),
//                         child: Stack(
//                           children: [
//                             Positioned(
//                               top: 50,
//                               left: 70,
//                               child: Text(
//                                 "Your Child's future is \n         our priority ",
//                                 style: TextStyle(
//                                     fontSize: 20,
//                                     color: white,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                             )
//                           ],
//                         ),
//                       ));
//                 },
//               );
//             }),
//       );
// }

// class Pic {
//   final String image;

//   Pic({required this.image});
// }
