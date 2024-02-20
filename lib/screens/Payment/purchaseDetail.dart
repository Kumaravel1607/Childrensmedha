import 'package:cmedha/screens/Constant/color.dart';
import 'package:cmedha/screens/Payment/Creditcard.dart';
import 'package:cmedha/screens/Payment/Paypal.dart';
import 'package:cmedha/screens/widget.dart';
import 'package:flutter/material.dart';

class PurchaseDetail extends StatefulWidget {
  const PurchaseDetail({super.key});

  @override
  State<PurchaseDetail> createState() => _PurchaseDetailState();
}

class _PurchaseDetailState extends State<PurchaseDetail>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Blue,
          leading: GestureDetector(
            onTap: () {
              // Navigator.of(context).pushAndRemoveUntil(
              //     MaterialPageRoute(builder: (c) => SearchFlight()),
              //     (route) => true);
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.chevron_left,
              size: 25,
              color: white,
            ),
          ),
          leadingWidth: 30,
          elevation: 2,
          titleSpacing: 1,
          title: text20('Payment', white)),
      body: SingleChildScrollView(
        child: Container(
            color: white,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total Price',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    '₹2720',
                    style: TextStyle(
                        color: Blue, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Select Payment method',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
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

                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)))),
                        // color: Color.fromARGB(255, 109, 179, 236)),

                        unselectedLabelColor: black,
                        labelColor: white,
                        labelStyle: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                        tabs: const [
                          Row(children: [
                            Icon(
                              Icons.credit_card,
                              //  color: black,
                              // size: 25,
                            ),
                            SizedBox(width: 15),
                            Text("Credit")
                          ]),
                          Row(children: [
                            Icon(
                              Icons.money,
                              // color: black,
                              size: 25,
                            ),
                            SizedBox(width: 15),
                            Text("Pay on Cash")
                          ]),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 1,
                    child: TabBarView(
                      controller: tabController,
                      children: [CreditCardPage(), const PaypalScreen()],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
