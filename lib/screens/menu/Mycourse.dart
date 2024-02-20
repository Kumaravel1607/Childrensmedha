import 'package:cmedha/screens/Constant/color.dart';
import 'package:cmedha/screens/widget.dart';
import 'package:flutter/material.dart';

class MyCoursePage extends StatefulWidget {
  const MyCoursePage({super.key});

  @override
  State<MyCoursePage> createState() => _MyCoursePageState();
}

class _MyCoursePageState extends State<MyCoursePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              // Navigator.of(context).pushAndRemoveUntil(
              //     MaterialPageRoute(builder: (c) => SearchFlight()),
              //     (route) => true);
              Navigator.pop(context);
            },
            child: Icon(
              Icons.chevron_left,
              size: 25,
              color: white,
            ),
          ),
          titleSpacing: 10,
          leadingWidth: 30,
          shadowColor: black,
          backgroundColor: Blue,
          title: text20('Enrolled Course', white),
          elevation: 3,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: ScrollPhysics(),
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index) {
                          // final booking = list[index];
                          return GestureDetector(
                              onTap: () {
                                // Navigator.of(context, rootNavigator: true)
                                //     .push(MaterialPageRoute(
                                //         builder: (context) =>
                                //             AddService()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 0),
                                child: SizedBox(
                                  // height: 210,
                                  child: Card(
                                    elevation: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, left: 5, right: 5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              SizedBox(
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  child: Image.asset(
                                                    'assets/images/course1.jpg',
                                                    fit: BoxFit.fill,
                                                    height: 100,
                                                    width: 110,
                                                  ),
                                                ),
                                              ),
                                              // SizedBox(
                                              //   // height: 100,
                                              //   // width: 100,
                                              //   // child: Container(
                                              //   //   decoration: BoxDecoration(
                                              //   //       borderRadius:
                                              //   //           BorderRadius.circular(5),
                                              //   //       image: DecorationImage(
                                              //   //           image: NetworkImage(
                                              //   //             booking.serviceImage,

                                              //   //             //  "assets/images/delete.png"
                                              //   //           ),
                                              //   //           fit: BoxFit.fill)),
                                              //   // ),
                                              //   // height: 100,
                                              //   child: ClipRRect(
                                              //     borderRadius:
                                              //         BorderRadius.circular(5),
                                              //     // child: Image.asset(
                                              //     //   'assets/images/ser.jpg',
                                              //     //   fit: BoxFit.fill,
                                              //     //   height: 100,
                                              //     //   width: 110,
                                              //     // ),
                                              //     child: Image.network(
                                              //       // booking.serviceImage,
                                              //       'assets/images/course1.jpg',
                                              //       fit: BoxFit.cover,
                                              //       height: 100,
                                              //       width: 110,
                                              //     ),
                                              //   ),
                                              //   // ),
                                              //   // child: Container(
                                              //   //   height: 150,
                                              //   //   width: double.infinity,
                                              //   //   decoration: BoxDecoration(
                                              //   //     borderRadius:
                                              //   //         BorderRadius.circular(5),
                                              //   //     image: DecorationImage(
                                              //   //       image: NetworkImage(
                                              //   //         booking.serviceImage,
                                              //   //       ),

                                              //   //       // image: AssetImage(
                                              //   //       //   'assets/images/car02.jpeg',
                                              //   //       // ),
                                              //   //       fit: BoxFit.fill,
                                              //   //     ),
                                              //   //   ),
                                              //   // ),
                                              //   //),
                                              // ),
                                              // SizedBox(
                                              //   width: 15,
                                              // ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    //     booking.serviceName,
                                                    'Analytical Skills / Mathematics',
                                                    overflow: TextOverflow.clip,
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: black),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        // booking.bookingDate
                                                        //     .toString(),
                                                        'Total Class: 20',
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: dash),
                                                      ),
                                                      SizedBox(
                                                        width: 30,
                                                      ),
                                                      Text(
                                                        // booking.bookingDate
                                                        //     .toString(),
                                                        '\$ 200',
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: dash),
                                                      ),
                                                    ],
                                                  ),

                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        // booking.bookingDate
                                                        //     .toString(),
                                                        'Start: 20/10/2024',
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: dash),
                                                      ),
                                                      SizedBox(
                                                        width: 20,
                                                      ),
                                                      Text(
                                                        // booking.bookingDate
                                                        //     .toString(),
                                                        'End: 30/11/2024',
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: dash),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  // RichText(
                                                  //   text: TextSpan(
                                                  //       text: 'Booking No : ',
                                                  //       style: TextStyle(
                                                  //           color: dash,
                                                  //           fontSize: 12,
                                                  //           fontWeight:
                                                  //               FontWeight.w600),
                                                  //       children: <TextSpan>[
                                                  //         TextSpan(
                                                  //           // text: booking
                                                  //           //     .bookingNo,
                                                  //           text: ' 12KS122020',
                                                  //           style: TextStyle(
                                                  //               color: Colors.black,
                                                  //               fontSize: 12,
                                                  //               fontWeight:
                                                  //                   FontWeight.w500),
                                                  //         )
                                                  //       ]),
                                                  // ),

                                                  Row(
                                                    children: [
                                                      Text(
                                                          // booking.statusText,
                                                          'Processing',
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: green)
                                                          // color: (Text ==
                                                          //         'On Going')
                                                          //     ? Colors.blue
                                                          //     : (Text ==
                                                          //             'Processing')
                                                          //         ? Colors.green
                                                          //         : (Text ==
                                                          //                 'Completed')
                                                          //             ? Colors.grey
                                                          //             : Colors
                                                          //                 .yellow
                                                          //                 .shade500),
                                                          ),
                                                      SizedBox(
                                                        width: 25,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          // Navigator.of(context,
                                                          //         rootNavigator:
                                                          //             true)
                                                          //     .push(MaterialPageRoute(
                                                          //         builder:
                                                          //             (context) =>
                                                          //                 // ViewDetails()
                                                          //                 ));
                                                        },
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              'View Details',
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Blue),
                                                            ),
                                                            Icon(
                                                                Icons
                                                                    .chevron_right,
                                                                size: 20,
                                                                color: Blue)
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ));
                        }),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//           child: Padding(
//         padding: const EdgeInsets.all(8),
//         child: Column(
//           children: [
//             Container(
//                 child: MediaQuery.removePadding(
//               context: context,
//               removeTop: true,
//               child:
//                   // isLoading == true
//                   //     ? CircularProgressIndicator()
//                   //     : list.length == 0
//                   //         ? Text("No List Found")
//                   //         :
//                   Column(
//                 children: [
//                   ListView.builder(
//                       shrinkWrap: true,
//                       scrollDirection: Axis.vertical,
//                       physics: ScrollPhysics(),
//                       itemCount: 4,
//                       itemBuilder: (BuildContext context, int index) {
//                         // final booking = list[index];
//                         return GestureDetector(
//                             onTap: () {
//                               // Navigator.of(context, rootNavigator: true)
//                               //     .push(MaterialPageRoute(
//                               //         builder: (context) =>
//                               //             AddService()));
//                             },
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                   vertical: 5, horizontal: 0),
//                               child: SizedBox(
//                                 // height: 210,
//                                 child: Card(
//                                   elevation: 2,
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(
//                                         top: 5, left: 5, right: 5),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Row(
//                                           // mainAxisAlignment:
//                                           //     MainAxisAlignment.spaceEvenly,
//                                           children: [
//                                             SizedBox(
//                                               // height: 100,
//                                               // width: 100,
//                                               // child: Container(
//                                               //   decoration: BoxDecoration(
//                                               //       borderRadius:
//                                               //           BorderRadius.circular(5),
//                                               //       image: DecorationImage(
//                                               //           image: NetworkImage(
//                                               //             booking.serviceImage,

//                                               //             //  "assets/images/delete.png"
//                                               //           ),
//                                               //           fit: BoxFit.fill)),
//                                               // ),
//                                               // height: 100,
//                                               child: ClipRRect(
//                                                 borderRadius:
//                                                     BorderRadius.circular(5),
//                                                 // child: Image.asset(
//                                                 //   'assets/images/ser.jpg',
//                                                 //   fit: BoxFit.fill,
//                                                 //   height: 100,
//                                                 //   width: 110,
//                                                 // ),
//                                                 child: Image.network(
//                                                   // booking.serviceImage,
//                                                   'assets/images/course1.jpg',
//                                                   fit: BoxFit.cover,
//                                                   height: 100,
//                                                   width: 110,
//                                                 ),
//                                               ),
//                                               // ),
//                                               // child: Container(
//                                               //   height: 150,
//                                               //   width: double.infinity,
//                                               //   decoration: BoxDecoration(
//                                               //     borderRadius:
//                                               //         BorderRadius.circular(5),
//                                               //     image: DecorationImage(
//                                               //       image: NetworkImage(
//                                               //         booking.serviceImage,
//                                               //       ),

//                                               //       // image: AssetImage(
//                                               //       //   'assets/images/car02.jpeg',
//                                               //       // ),
//                                               //       fit: BoxFit.fill,
//                                               //     ),
//                                               //   ),
//                                               // ),
//                                               //),
//                                             ),
//                                             SizedBox(
//                                               width: 15,
//                                             ),
//                                             Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 Text(
//                                                   //     booking.serviceName,
//                                                   'Standard Service & Battery \nCheckup',
//                                                   overflow: TextOverflow.clip,
//                                                   maxLines: 2,
//                                                   style: TextStyle(
//                                                       fontSize: 12,
//                                                       fontWeight:
//                                                           FontWeight.w600,
//                                                       color: black),
//                                                 ),
//                                                 SizedBox(
//                                                   height: 10,
//                                                 ),
//                                                 Text(
//                                                   // booking.bookingDate
//                                                   //     .toString(),
//                                                   '11 Tuesday,July 2023',
//                                                   style: TextStyle(
//                                                       fontSize: 12,
//                                                       fontWeight:
//                                                           FontWeight.w600,
//                                                       color: dash),
//                                                 ),
//                                                 SizedBox(
//                                                   height: 10,
//                                                 ),
//                                                 RichText(
//                                                   text: TextSpan(
//                                                       text: 'Booking No : ',
//                                                       style: TextStyle(
//                                                           color: dash,
//                                                           fontSize: 12,
//                                                           fontWeight:
//                                                               FontWeight.w600),
//                                                       children: <TextSpan>[
//                                                         TextSpan(
//                                                           // text: booking
//                                                           //     .bookingNo,
//                                                           text: ' 12KS122020',
//                                                           style: TextStyle(
//                                                               color:
//                                                                   Colors.black,
//                                                               fontSize: 12,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w500),
//                                                         )
//                                                       ]),
//                                                 ),
//                                                 SizedBox(
//                                                   height: 10,
//                                                 ),
//                                                 Row(
//                                                   children: [
//                                                     Text(
//                                                       // booking.statusText,
//                                                       'Processing',
//                                                       style: TextStyle(
//                                                           fontSize: 12,
//                                                           fontWeight:
//                                                               FontWeight.w500,
//                                                           color: (Text ==
//                                                                   'Confirmed')
//                                                               ? Colors.blue
//                                                               : (Text) ==
//                                                                       'Processing'
//                                                                   ? Colors.green
//                                                                   : (Text) ==
//                                                                           'Completed'
//                                                                       ? Colors
//                                                                           .grey
//                                                                       : Colors
//                                                                           .yellow
//                                                                           .shade500),
//                                                     ),
//                                                     SizedBox(
//                                                       width: 25,
//                                                     ),
//                                                     GestureDetector(
//                                                       onTap: () {
//                                                         // Navigator.of(context,
//                                                         //         rootNavigator:
//                                                         //             true)
//                                                         //     .push(MaterialPageRoute(
//                                                         //         builder:
//                                                         //             (context) =>
//                                                         //                 // ViewDetails()
//                                                         //                 ));
//                                                       },
//                                                       child: Row(
//                                                         children: [
//                                                           Text(
//                                                             'View Details',
//                                                             style: TextStyle(
//                                                                 fontSize: 12,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .w500,
//                                                                 color: Blue),
//                                                           ),
//                                                           Icon(
//                                                               Icons
//                                                                   .chevron_right,
//                                                               size: 20,
//                                                               color: Blue)
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 SizedBox(
//                                                   height: 10,
//                                                 ),
//                                               ],
//                                             ),
//                                           ],
//                                         ),
//                                         SizedBox(
//                                           height: 10,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ));
//                       }),
//                 ],
//               ),
//             ))
//           ],
//         ),
//       )),
//     );
//   }
// }
