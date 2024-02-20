import 'package:cmedha/screens/Constant/color.dart';
import 'package:cmedha/screens/Payment/Confirm.dart';
import 'package:cmedha/screens/widget.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
        title: text20('Course Cart', white),
        elevation: 3,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: ScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Card(
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      'assets/images/course2.jpg',
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.fill,
                                    )),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    //     booking.serviceName,
                                    'Analytical Skills / Mathematics',
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.justify,
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: black),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  text16('\$ 200', black),
                                ],
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.delete,
                                    color: red,
                                  ))
                            ],
                          ),
                        ),
                      );
                    }),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      text20('Sub price :', greytext),
                      SizedBox(
                        width: 20,
                      ),
                      text20('\$ 450', greytext),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      text20('Tax price :', greytext),
                      SizedBox(
                        width: 20,
                      ),
                      text20('\$ 50', greytext),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      text20('Total price :', black),
                      SizedBox(
                        width: 20,
                      ),
                      text20('\$ 500', black),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: Blue,
                minimumSize: Size.fromHeight(44),
              ),
              onPressed: () {
                Navigator.of(context, rootNavigator: true)
                    .push(MaterialPageRoute(builder: (context) => Confirm()));
                //   Navigator.of(context).push(MaterialPageRoute(
                //       builder: (context) => Navigation()));
              },
              child: const Text(
                'Confirm and Continue',
                style: TextStyle(
                  color: white,
                  fontSize: 18,
                  fontFamily: 'IBMPlexSans',
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
