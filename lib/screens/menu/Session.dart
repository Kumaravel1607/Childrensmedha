import 'package:cmedha/screens/Constant/color.dart';
import 'package:cmedha/screens/Session/Enquiry.dart';
import 'package:cmedha/screens/Session/FreeSession.dart';
import 'package:cmedha/screens/widget.dart';
import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SessionScreen extends StatefulWidget {
  const SessionScreen({super.key});

  @override
  State<SessionScreen> createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(length: 2, vsync: this);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.chevron_left,
            color: Colors.white,
          ),
        ),
        titleSpacing: 10,
        leadingWidth: 30,
        backgroundColor: Colors.blue,
        title: text20('Course Session', white),
      ),
      body:
          //  SingleChildScrollView(
          //   child: SafeArea(
          //     child: Padding(
          //       padding: const EdgeInsets.all(10),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           // Text(
          //           //   'Select Service',
          //           //   style: TextStyle(
          //           //       color: black, fontSize: 20, fontWeight: FontWeight.w700),
          //           // ),

          //           Container(
          //             color: Blue,
          //             height: 50,
          //             child: Card(
          //               color: greylite,
          //               elevation: 2,
          //               // height: 50,
          //               child: TabBar(
          //                 //  indicatorPadding: EdgeInsets.all(10),
          //                 controller: tabController,
          //                 indicator: ShapeDecoration(
          //                     color: Blue,
          //                     //   shape: StadiumBorder(),
          //                     // ),
          //                     shape: RoundedRectangleBorder(
          //                         borderRadius: new BorderRadius.all(
          //                             new Radius.circular(5)))),
          //                 // color: Color.fromARGB(255, 109, 179, 236)),
          //                 // color: Colors.indigo,
          //                 unselectedLabelColor: black,
          //                 labelColor: white,
          //                 labelStyle: TextStyle(
          //                     fontSize: 14, fontWeight: FontWeight.w500),
          //                 tabs: [
          //                   Row(children: [
          //                     Image.asset(
          //                       'assets/images/freesession.png',
          //                       width: 50,
          //                       height: 50,
          //                     ),
          //                     // Icon(
          //                     //   Icons.arrow_forward,
          //                     //   //  color: black,
          //                     //   // size: 25,
          //                     // ),
          //                     SizedBox(width: 15),
          //                     Text(
          //                       "Car",
          //                       style: TextStyle(
          //                         fontSize: 16,
          //                         fontWeight: FontWeight.w600,
          //                       ),
          //                     )
          //                   ]),
          //                   Row(children: [
          //                     Image.asset(
          //                       'assets/images/enquiry.png',
          //                       width: 50,
          //                       height: 50,
          //                     ),
          //                     SizedBox(width: 15),
          //                     Text(
          //                       "Bike",
          //                       style: TextStyle(
          //                         fontSize: 16,
          //                         fontWeight: FontWeight.w600,
          //                       ),
          //                     )
          //                   ]),
          //                   // Tab(text: 'Round Trip'),
          //                 ],
          //               ),
          //             ),
          //           ),
          //           // SizedBox(
          //           //   height: 10,
          //           // ),
          //           Container(
          //             height: MediaQuery.of(context).size.height * 1.4,
          //             child: TabBarView(
          //               controller: tabController,
          //               children: [Enquiry(), FreeSession()],
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          //)
          SingleChildScrollView(
        child: Container(
            color: white,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                    child: Card(
                      color: greylite,
                      elevation: 2,
                      // height: 50,
                      child: TabBar(
                        indicatorSize: TabBarIndicatorSize.tab,
                        //  indicatorPadding: EdgeInsets.all(10),
                        controller: tabController,
                        indicator: const ShapeDecoration(
                            color: Blue,
                            //   shape: StadiumBorder(),
                            // ),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)))),
                        // color: Color.fromARGB(255, 109, 179, 236)),
                        // color: Colors.indigo,
                        unselectedLabelColor: black,
                        labelColor: white,
                        labelStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                        tabs: [
                          Row(children: [
                            Image.asset(
                              'assets/images/freesession.png',
                              width: 50,
                              height: 30,
                            ),
                            const SizedBox(width: 15),
                            const Text("Free Session")
                          ]),

                          Row(children: [
                            Image.asset(
                              'assets/images/enquiry.png',
                              width: 50,
                              height: 30,
                            ),
                            const SizedBox(width: 15),
                            const Text("Enquiry")
                          ]),

                          // Tab(text: 'Round Trip'),
                          // Row(children: [
                          //   Icon(
                          //     Icons.sports_cricket,
                          //     //color: black,
                          //     size: 25,
                          //   ),
                          //   SizedBox(width: 5),
                          //   Text("Others")
                          // ]),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 1,
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        const FreeSession(),
                        const Enquiry(),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
