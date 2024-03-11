import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cmedha/Api/Api.dart';
import 'package:cmedha/Models/booking_model.dart';
import 'package:cmedha/screens/Constant/color.dart';
import 'package:cmedha/screens/widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'package:shared_preferences/shared_preferences.dart';

class MyCoursePage extends StatefulWidget {
  const MyCoursePage({Key? key});

  @override
  State<MyCoursePage> createState() => _MyCoursePageState();
}

class _MyCoursePageState extends State<MyCoursePage> {
  List<BookingData> bookingDataList = [];

  @override
  void initState() {
    super.initState();
    fetchBookingData();
  }

  Future<void> fetchBookingData() async {
    SharedPreferences session = await SharedPreferences.getInstance();
    var userId = session.getInt('user_id');
    print(userId);
    var url = mybooking;
    var urlparse = Uri.parse(url);
    var data = {'user_id': userId.toString()};
    final response = await http.post(urlparse, body: data);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final List<BookingData> bookings =
          bookingDataFromJson(json.encode(responseData['booking']));
      setState(() {
        bookingDataList = bookings;
      });
    } else {
      print('Failed to load booking data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
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
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: bookingDataList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final booking = bookingDataList[index];
                    if (bookingDataList.isEmpty)
                      Center(child: Text('No bookings available.'));
                    else
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 0,
                        ),
                        child: Card(
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    width: 110,
                                    height: 100,
                                    child: CachedNetworkImage(
                                      imageUrl: booking.courseImage,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) => Center(
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Blue),
                                          backgroundColor: Colors.white,
                                          strokeWidth: 2,
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      booking.courseName,
                                      overflow: TextOverflow.clip,
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: black,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      '${booking.currency} ${booking.totalPrice}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: dash,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      DateFormat.yMd().format(booking.date),
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: dash,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      booking.bookingStatus,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: getStatusColor(
                                            booking.bookingStatus),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
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

  Color getStatusColor(String status) {
    switch (status) {
      case 'Success':
        return Colors.green;
      case 'Failed':
        return Colors.yellow;
      case 'Cancelled':
        return Colors.red;
      default:
        return Colors.yellow.shade500;
    }
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
