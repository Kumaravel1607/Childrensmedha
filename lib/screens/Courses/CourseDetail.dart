import 'dart:math';

import 'package:cmedha/Navigation.dart';
import 'package:cmedha/screens/Constant/color.dart';
//import 'package:cmedha/screens/Course.dart';
import 'package:cmedha/screens/Courses/About.dart';
import 'package:cmedha/screens/Courses/Lesson.dart';
import 'package:cmedha/screens/Courses/Review.dart';
import 'package:cmedha/screens/Payment/purchaseDetail.dart';
import 'package:cmedha/screens/widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CourseDetailPage extends StatefulWidget {
  const CourseDetailPage({super.key});

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  // late TabController tabController = TabController(length: 3, vsync: this);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: const Icon(
              Icons.chevron_left_outlined,
              size: 30,
              color: white,
            ),
            onTap: () {
              Navigator.pop(context);
              // Navigator.of(context, rootNavigator: true).push(
              //   MaterialPageRoute(builder: (context) => Navigation()),
              // );
              // Navigator.pop(context);
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (BuildContext context) => CourseScreen()));
            },
          ),
          titleSpacing: 0,
          title: text20('Course Details', white),
          // leading: Align(
          //   alignment: Alignment.center,
          //   child: text20('Course Details', white),
          // ),
          backgroundColor: Blue,
        ),
        body: DefaultTabController(
          length: 3,
          child: Stack(
            children: [
              SizedBox(
                  width: double.infinity,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                      // color: Colors.grey[300],
                      color: black,

                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(1), BlendMode.dstATop),
                        image: const AssetImage(
                          'assets/images/6th.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                      // SliverAppBar(
                      //   floating: false,
                      //   pinned: true,
                      //   flexibleSpace: FlexibleSpaceBar(
                      //     title: text20(
                      //         '6th Grade (SAINIK/RMS/RIMS)', black),
                      //   ),
                      // ),
                      // child: Image.asset(
                      //   'assets/images/6th.jpg',
                      //   //  Image.network(
                      //   //   'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2700&q=80',
                      //   fit: BoxFit.cover,
                    ),
                  )),
              //   Image.asset(
              //     'assets/images/6th.jpg',
              //     //  Image.network(
              //     //   'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2700&q=80',
              //     fit: BoxFit.cover,
              //     height: MediaQuery.of(context).size.height * 0.3,
              //   ),
              // ),
              // Positioned(
              //   top: 30,
              //   left: 10,
              //   child: IconButton(
              //     onPressed: () {
              //       Navigator.pop(context);
              //     },
              //     icon: Icon(
              //       Icons.arrow_back_ios,
              //       size: 30,
              //       color: black,
              //     ),
              //   ),
              // ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  decoration: const BoxDecoration(
                      // borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                  child: ClipRRect(
                    //borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: CustomScrollView(
                      //physics: NeverScrollableScrollPhysics(),
                      clipBehavior: Clip.hardEdge,
                      anchor: 0.3,
                      slivers: [
                        SliverToBoxAdapter(
                          child: Container(
                            //height: 900,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 16.0,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // SliverAppBar(
                                  //   floating: false,
                                  //   pinned: true,
                                  //   flexibleSpace: FlexibleSpaceBar(
                                  //     title: text20(
                                  //         '6th Grade (SAINIK/RMS/RIMS)', black),
                                  //   ),
                                  // ),
                                  text20('6th Grade (SAINIK/RMS/RIMS)', black),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const FaIcon(
                                            Icons.smart_display,
                                            size: 20,
                                            color: greytext,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          text16('80 hours', greytext)
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const FaIcon(
                                            Icons.library_books,
                                            size: 20,
                                            color: greytext,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          text16('20 Syllabus', greytext)
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const FaIcon(
                                            Icons.verified,
                                            size: 20,
                                            color: greytext,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          text16('1 year', greytext)
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TabBar(
                                    dividerHeight: 2,
                                    indicatorWeight: 2,
                                    tabAlignment: TabAlignment.start,
                                    isScrollable: true,
                                    controller: tabController,
                                    labelPadding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    tabs: [
                                      text16('Mathematics', black),
                                      text16('Reasoning', black),
                                      text16('General Knowledge', black),
                                      text16('English', black)
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height,
                                    child: TabBarView(
                                      controller: tabController,
                                      children: [
                                        Course01(),
                                        Course01(),
                                        Course01(),
                                        Course01(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Stack(
          // overflow: Overflow.visible,
          alignment: const FractionalOffset(.5, 1.0),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Blue,
                ),
                height: 65.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  text20('Price', black),
                  text20(' \$2500', white),
                  const Text(
                    '\$3000',
                    style: TextStyle(
                        color: black,
                        decoration: TextDecoration.lineThrough,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    child: Row(
                      children: [
                        const FaIcon(
                          Icons.shopping_cart_checkout_sharp,
                          color: Blue,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        text20('Enroll', Blue),
                      ],
                    ),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                            builder: (context) => const PurchaseDetail()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}









// import 'dart:math';

// import 'package:cmedha/screens/Constant/color.dart';
// import 'package:cmedha/screens/Course.dart';
// import 'package:cmedha/screens/Courses/About.dart';
// import 'package:cmedha/screens/Courses/Lesson.dart';
// import 'package:cmedha/screens/Courses/Review.dart';
// import 'package:cmedha/screens/widget.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class CourseDetailPage extends StatefulWidget {
//   const CourseDetailPage({super.key});

//   @override
//   State<CourseDetailPage> createState() => _CourseDetailPageState();
// }

// class _CourseDetailPageState extends State<CourseDetailPage>
//     with SingleTickerProviderStateMixin {
//   late TabController tabController = TabController(length: 3, vsync: this);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           leading: GestureDetector(
//             child: const Icon(
//               Icons.chevron_left_outlined,
//               size: 30,
//               color: white,
//             ),
//             onTap: () {
//               Navigator.pop(context);
//               // Navigator.of(context, rootNavigator: true).push(
//               //   MaterialPageRoute(builder: (context) => CourseScreen()),
//               // );
//               // Navigator.pop(context);
//               // Navigator.of(context).push(MaterialPageRoute(
//               //     builder: (BuildContext context) => CourseScreen()));
//             },
//           ),
//           titleSpacing: 0,
//           title: text20('Course Details', white),
//           // leading: Align(
//           //   alignment: Alignment.center,
//           //   child: text20('Course Details', white),
//           // ),
//           backgroundColor: Blue,
//         ),
//         body: DefaultTabController(
//           length: 3,
//           child: Stack(
//             children: [
//               SizedBox(
//                   width: double.infinity,
//                   child: Container(
//                     height: MediaQuery.of(context).size.height * 0.3,
//                     decoration: BoxDecoration(
//                       // color: Colors.grey[300],
//                       color: black,

//                       image: DecorationImage(
//                         colorFilter: new ColorFilter.mode(
//                             Colors.black.withOpacity(1), BlendMode.dstATop),
//                         image: const AssetImage(
//                           'assets/images/6th.jpg',
//                         ),
//                         fit: BoxFit.cover,
//                       ),
//                       // SliverAppBar(
//                       //   floating: false,
//                       //   pinned: true,
//                       //   flexibleSpace: FlexibleSpaceBar(
//                       //     title: text20(
//                       //         '6th Grade (SAINIK/RMS/RIMS)', black),
//                       //   ),
//                       // ),
//                       // child: Image.asset(
//                       //   'assets/images/6th.jpg',
//                       //   //  Image.network(
//                       //   //   'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2700&q=80',
//                       //   fit: BoxFit.cover,
//                     ),
//                   )),
//               //   Image.asset(
//               //     'assets/images/6th.jpg',
//               //     //  Image.network(
//               //     //   'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2700&q=80',
//               //     fit: BoxFit.cover,
//               //     height: MediaQuery.of(context).size.height * 0.3,
//               //   ),
//               // ),
//               // Positioned(
//               //   top: 30,
//               //   left: 10,
//               //   child: IconButton(
//               //     onPressed: () {
//               //       Navigator.pop(context);
//               //     },
//               //     icon: Icon(
//               //       Icons.arrow_back_ios,
//               //       size: 30,
//               //       color: black,
//               //     ),
//               //   ),
//               // ),
//               Align(
//                 alignment: Alignment.topCenter,
//                 child: Container(
//                   decoration: const BoxDecoration(
//                       // borderRadius: BorderRadius.all(Radius.circular(30)),
//                       ),
//                   child: ClipRRect(
//                     //borderRadius: const BorderRadius.all(Radius.circular(30)),
//                     child: CustomScrollView(
//                       //physics: NeverScrollableScrollPhysics(),
//                       clipBehavior: Clip.hardEdge,
//                       anchor: 0.3,
//                       slivers: [
//                         SliverToBoxAdapter(
//                           child: Container(
//                             //height: 900,
//                             decoration: const BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(20.0),
//                                 topRight: Radius.circular(20.0),
//                               ),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.grey,
//                                   offset: Offset(0.0, 1.0), //(x,y)
//                                   blurRadius: 16.0,
//                                 ),
//                               ],
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                   vertical: 20, horizontal: 10),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   // SliverAppBar(
//                                   //   floating: false,
//                                   //   pinned: true,
//                                   //   flexibleSpace: FlexibleSpaceBar(
//                                   //     title: text20(
//                                   //         '6th Grade (SAINIK/RMS/RIMS)', black),
//                                   //   ),
//                                   // ),
//                                   text20('6th Grade (SAINIK/RMS/RIMS)', black),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           const FaIcon(
//                                             Icons.smart_display,
//                                             size: 20,
//                                             color: greytext,
//                                           ),
//                                           const SizedBox(
//                                             width: 5,
//                                           ),
//                                           text16('80 hours', greytext)
//                                         ],
//                                       ),
//                                       Row(
//                                         children: [
//                                           const FaIcon(
//                                             Icons.library_books,
//                                             size: 20,
//                                             color: greytext,
//                                           ),
//                                           const SizedBox(
//                                             width: 5,
//                                           ),
//                                           text16('20 Syllabus', greytext)
//                                         ],
//                                       ),
//                                       Row(
//                                         children: [
//                                           const FaIcon(
//                                             Icons.verified,
//                                             size: 20,
//                                             color: greytext,
//                                           ),
//                                           const SizedBox(
//                                             width: 5,
//                                           ),
//                                           text16('1 year', greytext)
//                                         ],
//                                       )
//                                     ],
//                                   ),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                   TabBar(
//                                     tabs: [
//                                       text16('About', black),
//                                       text16('Lesson', black),
//                                       text16('Review', black)
//                                     ],
//                                   ),
//                                   SizedBox(
//                                     height: MediaQuery.of(context).size.height,
//                                     child: TabBarView(
//                                       controller: tabController,
//                                       children: [
//                                         const AboutCourse(),
//                                         const LessonCourse(),
//                                         const CourseReview()
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         bottomNavigationBar: Stack(
//           // overflow: Overflow.visible,
//           alignment: const FractionalOffset(.5, 1.0),
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: Blue,
//                 ),
//                 height: 65.0,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 15),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   text20('Price', black),
//                   text20(' \$2500', white),
//                   Text(
//                     '\$3000',
//                     style: TextStyle(
//                         color: black,
//                         decoration: TextDecoration.lineThrough,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600),
//                   ),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: white,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15.0),
//                       ),
//                     ),
//                     child: Row(
//                       children: [
//                         const FaIcon(
//                           Icons.shopping_cart_checkout_sharp,
//                           color: Blue,
//                         ),
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         text20('Enroll', Blue),
//                       ],
//                     ),
//                     onPressed: () => print('hello world'),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ));
//   }

// // List _listview(int count) {
// //   List<Widget> listItems = List();

// //   listItems.add(Container(
// //     color: Colors.black,
// //     height: 50,
// //     child: TabBar(
// //       tabs: [FlutterLogo(), FlutterLogo()],
// //     ),
// //   ));

// //   for (int i = 0; i < count; i++) {
// //     listItems.add(new Padding(padding: new EdgeInsets.all(20.0), child: new Text('Item ${i.toString()}', style: new TextStyle(fontSize: 25.0))));
// //   }

// //   return listItems;
// // }

//   // bottomNavigationBar: BottomNavigationBar(items: [
//   //   BottomNavigationBarItem(
//   //     icon: new FaIcon(Icons.shopping_cart_checkout_sharp),
//   //     label: 'totalCartValue',
//   //   ),
//   // ]),
// }







// // import 'dart:math';

// // import 'package:cmedha/screens/Constant/color.dart';
// // import 'package:cmedha/screens/Course.dart';
// // import 'package:cmedha/screens/Courses/About.dart';
// // import 'package:cmedha/screens/Courses/Lesson.dart';
// // import 'package:cmedha/screens/Courses/Review.dart';
// // import 'package:cmedha/screens/widget.dart';
// // import 'package:flutter/material.dart';
// // import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// // class CourseDetailPage extends StatefulWidget {
// //   const CourseDetailPage({super.key});

// //   @override
// //   State<CourseDetailPage> createState() => _CourseDetailPageState();
// // }

// // class _CourseDetailPageState extends State<CourseDetailPage>
// //     with SingleTickerProviderStateMixin {
// //   late TabController tabController = TabController(length: 3, vsync: this);
// //   bool scroll = false;
// //   @override
// //   void initState() {
// //     // TODO: implement initState
// //     super.initState();
// //     scroll = true;
// //   }

// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         // appBar: AppBar(
// //         //   leading: GestureDetector(
// //         //     child: const Icon(
// //         //       Icons.chevron_left_outlined,
// //         //       size: 30,
// //         //       color: white,
// //         //     ),
// //         //     onTap: () {
// //         //       Navigator.pop(context);
// //         //       // Navigator.of(context, rootNavigator: true).push(
// //         //       //   MaterialPageRoute(builder: (context) => CourseScreen()),
// //         //       // );
// //         //       // Navigator.pop(context);
// //         //       // Navigator.of(context).push(MaterialPageRoute(
// //         //       //     builder: (BuildContext context) => CourseScreen()));
// //         //     },
// //         //   ),
// //         //   titleSpacing: 0,
// //         //   title: text20('Course Details', white),
// //         //   // leading: Align(
// //         //   //   alignment: Alignment.center,
// //         //   //   child: text20('Course Details', white),
// //         //   // ),
// //         //   backgroundColor: Blue,
// //         // ),

// //         body: DefaultTabController(
// //           length: 3,
// //           child: Stack(
// //             children: [
// //               SizedBox(
// //                   width: double.infinity,
// //                   child: Container(
// //                     height: MediaQuery.of(context).size.height * 0.3,
// //                     decoration: BoxDecoration(
// //                       // color: Colors.grey[300],
// //                       color: black,

// //                       image: DecorationImage(
// //                         colorFilter: new ColorFilter.mode(
// //                             Colors.black.withOpacity(1), BlendMode.dstATop),
// //                         image: const AssetImage(
// //                           'assets/images/6th.jpg',
// //                         ),
// //                         fit: BoxFit.cover,
// //                       ),
// //                       // SliverAppBar(
// //                       //   floating: false,
// //                       //   pinned: true,
// //                       //   flexibleSpace: FlexibleSpaceBar(
// //                       //     title: text20(
// //                       //         '6th Grade (SAINIK/RMS/RIMS)', black),
// //                       //   ),
// //                       // ),
// //                       // child: Image.asset(
// //                       //   'assets/images/6th.jpg',
// //                       //   //  Image.network(
// //                       //   //   'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2700&q=80',
// //                       //   fit: BoxFit.cover,
// //                     ),
// //                   )),
// //               //   Image.asset(
// //               //     'assets/images/6th.jpg',
// //               //     //  Image.network(
// //               //     //   'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2700&q=80',
// //               //     fit: BoxFit.cover,
// //               //     height: MediaQuery.of(context).size.height * 0.3,
// //               //   ),
// //               // ),
// //               // Positioned(
// //               //   top: 30,
// //               //   left: 10,
// //               //   child: IconButton(
// //               //     onPressed: () {
// //               //       Navigator.pop(context);
// //               //     },
// //               //     icon: Icon(
// //               //       Icons.arrow_back_ios,
// //               //       size: 30,
// //               //       color: black,
// //               //     ),
// //               //   ),
// //               // ),
// //               Align(
// //                 alignment: Alignment.topCenter,
// //                 child: Container(
// //                   decoration: const BoxDecoration(
// //                       // borderRadius: BorderRadius.all(Radius.circular(30)),
// //                       ),
// //                   child: ClipRRect(
// //                     //borderRadius: const BorderRadius.all(Radius.circular(30)),
// //                     child: CustomScrollView(
// //                       slivers: <Widget>[
// //                         // SliverAppBar
// //                         // SliverAppBar(
// //                         //   expandedHeight: 200.0,
// //                         //   floating: false,
// //                         //   pinned: true,
// //                         //   flexibleSpace: FlexibleSpaceBar(
// //                         //     // title:
// //                         //     //     text16('6th Grade (SAINIK/RMS/RIMS)', black),
// //                         //     background: Image.asset(
// //                         //       'assets/images/6th.jpg',
// //                         //       fit: BoxFit
// //                         //           .cover, // Ensure the image covers the entire space
// //                         //     ),
// //                         //   ),
// //                         //   bottom: AppBar(
// //                         //     shape: RoundedRectangleBorder(
// //                         //       borderRadius: BorderRadius.only(
// //                         //         topLeft: Radius.circular(20.0),
// //                         //         topRight: Radius.circular(20.0),
// //                         //       ),
// //                         //     ),
// //                         //     title: text16('6th Grade (SAINIK/RMS/RIMS)', black),
// //                         //   ),
// //                         // ),

// //                         // SliverList
// //                         SliverToBoxAdapter(
// //                           child: Container(
// //                             //height: 900,
// //                             decoration: const BoxDecoration(
// //                               color: Colors.white,
// //                               // borderRadius: BorderRadius.only(
// //                               //   topLeft: Radius.circular(20.0),
// //                               //   topRight: Radius.circular(20.0),
// //                               // ),
// //                               boxShadow: [
// //                                 BoxShadow(
// //                                   color: Colors.grey,
// //                                   offset: Offset(0.0, 1.0), //(x,y)
// //                                   blurRadius: 16.0,
// //                                 ),
// //                               ],
// //                             ),
// //                             child: Padding(
// //                               padding: const EdgeInsets.symmetric(
// //                                   vertical: 20, horizontal: 10),
// //                               child: Column(
// //                                 crossAxisAlignment: CrossAxisAlignment.start,
// //                                 children: [
// //                                   // SliverAppBar(
// //                                   //   floating: false,
// //                                   //   pinned: true,
// //                                   //   flexibleSpace: FlexibleSpaceBar(
// //                                   //     title: text20(
// //                                   //         '6th Grade (SAINIK/RMS/RIMS)', black),
// //                                   //   ),
// //                                   // ),
// //                                   text20('6th Grade (SAINIK/RMS/RIMS)', black),
// //                                   const SizedBox(
// //                                     height: 10,
// //                                   ),
// //                                   Row(
// //                                     mainAxisAlignment:
// //                                         MainAxisAlignment.spaceBetween,
// //                                     children: [
// //                                       Row(
// //                                         children: [
// //                                           const FaIcon(
// //                                             Icons.smart_display,
// //                                             size: 20,
// //                                             color: greytext,
// //                                           ),
// //                                           const SizedBox(
// //                                             width: 5,
// //                                           ),
// //                                           text16('80 hours', greytext)
// //                                         ],
// //                                       ),
// //                                       Row(
// //                                         children: [
// //                                           const FaIcon(
// //                                             Icons.library_books,
// //                                             size: 20,
// //                                             color: greytext,
// //                                           ),
// //                                           const SizedBox(
// //                                             width: 5,
// //                                           ),
// //                                           text16('20 Syllabus', greytext)
// //                                         ],
// //                                       ),
// //                                       Row(
// //                                         children: [
// //                                           const FaIcon(
// //                                             Icons.verified,
// //                                             size: 20,
// //                                             color: greytext,
// //                                           ),
// //                                           const SizedBox(
// //                                             width: 5,
// //                                           ),
// //                                           text16('1 year', greytext)
// //                                         ],
// //                                       )
// //                                     ],
// //                                   ),
// //                                   const SizedBox(
// //                                     height: 10,
// //                                   ),
// //                                   TabBar(
// //                                     tabs: [
// //                                       text16('About', black),
// //                                       text16('Lesson', black),
// //                                       text16('Review', black)
// //                                     ],
// //                                   ),
// //                                   SizedBox(
// //                                     height: MediaQuery.of(context).size.height,
// //                                     child: TabBarView(
// //                                       controller: tabController,
// //                                       children: [
// //                                         const AboutCourse(),
// //                                         const LessonCourse(),
// //                                         const CourseReview()
// //                                       ],
// //                                     ),
// //                                   ),
// //                                 ],
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                       ],
// //                     ),

// //                     //  CustomScrollView(
// //                     //   //physics: NeverScrollableScrollPhysics(),
// //                     //   clipBehavior: Clip.hardEdge,
// //                     //   anchor: 0.3,
// //                     //   slivers: [
// //                     //     SliverToBoxAdapter(
// //                     //       child: Container(
// //                     //         //height: 900,
// //                     //         decoration: const BoxDecoration(
// //                     //           color: Colors.white,
// //                     //           borderRadius: BorderRadius.only(
// //                     //             topLeft: Radius.circular(20.0),
// //                     //             topRight: Radius.circular(20.0),
// //                     //           ),
// //                     //           boxShadow: [
// //                     //             BoxShadow(
// //                     //               color: Colors.grey,
// //                     //               offset: Offset(0.0, 1.0), //(x,y)
// //                     //               blurRadius: 16.0,
// //                     //             ),
// //                     //           ],
// //                     //         ),
// //                     //         child: Padding(
// //                     //           padding: const EdgeInsets.symmetric(
// //                     //               vertical: 20, horizontal: 10),
// //                     //           child: Column(
// //                     //             crossAxisAlignment: CrossAxisAlignment.start,
// //                     //             children: [
// //                     //               // SliverAppBar(
// //                     //               //   floating: false,
// //                     //               //   pinned: true,
// //                     //               //   flexibleSpace: FlexibleSpaceBar(
// //                     //               //     title: text20(
// //                     //               //         '6th Grade (SAINIK/RMS/RIMS)', black),
// //                     //               //   ),
// //                     //               // ),
// //                     //               text20('6th Grade (SAINIK/RMS/RIMS)', black),
// //                     //               const SizedBox(
// //                     //                 height: 10,
// //                     //               ),
// //                     //               Row(
// //                     //                 mainAxisAlignment:
// //                     //                     MainAxisAlignment.spaceBetween,
// //                     //                 children: [
// //                     //                   Row(
// //                     //                     children: [
// //                     //                       const FaIcon(
// //                     //                         Icons.smart_display,
// //                     //                         size: 20,
// //                     //                         color: greytext,
// //                     //                       ),
// //                     //                       const SizedBox(
// //                     //                         width: 5,
// //                     //                       ),
// //                     //                       text16('80 hours', greytext)
// //                     //                     ],
// //                     //                   ),
// //                     //                   Row(
// //                     //                     children: [
// //                     //                       const FaIcon(
// //                     //                         Icons.library_books,
// //                     //                         size: 20,
// //                     //                         color: greytext,
// //                     //                       ),
// //                     //                       const SizedBox(
// //                     //                         width: 5,
// //                     //                       ),
// //                     //                       text16('20 Syllabus', greytext)
// //                     //                     ],
// //                     //                   ),
// //                     //                   Row(
// //                     //                     children: [
// //                     //                       const FaIcon(
// //                     //                         Icons.verified,
// //                     //                         size: 20,
// //                     //                         color: greytext,
// //                     //                       ),
// //                     //                       const SizedBox(
// //                     //                         width: 5,
// //                     //                       ),
// //                     //                       text16('1 year', greytext)
// //                     //                     ],
// //                     //                   )
// //                     //                 ],
// //                     //               ),
// //                     //               const SizedBox(
// //                     //                 height: 10,
// //                     //               ),
// //                     //               TabBar(
// //                     //                 tabs: [
// //                     //                   text16('About', black),
// //                     //                   text16('Lesson', black),
// //                     //                   text16('Review', black)
// //                     //                 ],
// //                     //               ),
// //                     //               SizedBox(
// //                     //                 height: MediaQuery.of(context).size.height,
// //                     //                 child: TabBarView(
// //                     //                   controller: tabController,
// //                     //                   children: [
// //                     //                     const AboutCourse(),
// //                     //                     const LessonCourse(),
// //                     //                     const CourseReview()
// //                     //                   ],
// //                     //                 ),
// //                     //               ),
// //                     //             ],
// //                     //           ),
// //                     //         ),
// //                     //       ),
// //                     //     ),
// //                     //   ],
// //                     // ),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //         bottomNavigationBar: Stack(
// //           // overflow: Overflow.visible,
// //           alignment: const FractionalOffset(.5, 1.0),
// //           children: [
// //             Padding(
// //               padding: const EdgeInsets.all(8.0),
// //               child: Container(
// //                 decoration: BoxDecoration(
// //                   borderRadius: BorderRadius.circular(20),
// //                   color: Blue,
// //                 ),
// //                 height: 65.0,
// //               ),
// //             ),
// //             Padding(
// //               padding: const EdgeInsets.only(bottom: 15),
// //               child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                 children: [
// //                   text20('Price', black),
// //                   text20(' \$2500', white),
// //                   Text(
// //                     '\$3000',
// //                     style: TextStyle(
// //                         color: black,
// //                         decoration: TextDecoration.lineThrough,
// //                         fontSize: 16,
// //                         fontWeight: FontWeight.w600),
// //                   ),
// //                   ElevatedButton(
// //                     style: ElevatedButton.styleFrom(
// //                       backgroundColor: white,
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(15.0),
// //                       ),
// //                     ),
// //                     child: Row(
// //                       children: [
// //                         const FaIcon(
// //                           Icons.shopping_cart_checkout_sharp,
// //                           color: Blue,
// //                         ),
// //                         const SizedBox(
// //                           width: 10,
// //                         ),
// //                         text20('Enroll', Blue),
// //                       ],
// //                     ),
// //                     onPressed: () => print('hello world'),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ));
// //   }

// // // List _listview(int count) {
// // //   List<Widget> listItems = List();

// // //   listItems.add(Container(
// // //     color: Colors.black,
// // //     height: 50,
// // //     child: TabBar(
// // //       tabs: [FlutterLogo(), FlutterLogo()],
// // //     ),
// // //   ));

// // //   for (int i = 0; i < count; i++) {
// // //     listItems.add(new Padding(padding: new EdgeInsets.all(20.0), child: new Text('Item ${i.toString()}', style: new TextStyle(fontSize: 25.0))));
// // //   }

// // //   return listItems;
// // // }

// //   // bottomNavigationBar: BottomNavigationBar(items: [
// //   //   BottomNavigationBarItem(
// //   //     icon: new FaIcon(Icons.shopping_cart_checkout_sharp),
// //   //     label: 'totalCartValue',
// //   //   ),
// //   // ]),
// // }
