import 'package:cmedha/Navigation.dart';
import 'package:cmedha/screens/Constant/color.dart';
import 'package:flutter/material.dart';

class Confirm extends StatefulWidget {
  Confirm({Key? key}) : super(key: key);

  @override
  State<Confirm> createState() => _ConfirmState();
}

class _ConfirmState extends State<Confirm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Blue,

          titleSpacing: 10,
          leadingWidth: 30,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => Redirect()),
              // );
            },
            child: const Icon(
              Icons.chevron_left,
              color: white,
            ),
          ),

          title: const Text(
            'Thank you',
            style: TextStyle(
              color: white,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          // actions: [
          //   IconButton(
          //       onPressed: () {},
          //       icon: Image.asset(
          //         'assets/images/share.png',
          //         width: 19,
          //         height: 20,
          //       )),
          // ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 72),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 116,
                              width: 116,
                              // margin: EdgeInsets.all(100.0),
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 116, 223, 119)
                                          .withOpacity(0.6),
                                  shape: BoxShape.circle),
                            ),
                            Positioned(
                              top: 28,
                              left: 28,
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                    width: 5,
                                    color:
                                        const Color.fromARGB(255, 75, 190, 79),
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.done_sharp,
                                    size: 30,
                                    color: Color.fromARGB(255, 75, 190, 79),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'Your booking is Confirmed!',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Purchase details have been sent to your registered email.',
                          style: TextStyle(
                            fontSize: 14,
                            color: lite,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 2,
                        color: Blue,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: white,
                  minimumSize: const Size.fromHeight(44),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Navigation(
                            name: '',
                          )));
                },
                child: const Text(
                  'Back to Home',
                  style: TextStyle(
                    color: Blue,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
