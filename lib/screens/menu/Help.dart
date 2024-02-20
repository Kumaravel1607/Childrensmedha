import 'package:cmedha/screens/Constant/color.dart';
import 'package:cmedha/screens/widget.dart';
import 'package:flutter/material.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Blue,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.chevron_left,
              color: white,
              size: 30,
            )),
        titleSpacing: 10,
        leadingWidth: 30,

        title: const Text('Help and Support',
            style: TextStyle(
              color: white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            )),
        // title: Image.asset(
        //   "assets/images/peslogo.png",
        //   height: 50,
        //   width: 100,
        // ),
        // centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Image.asset(
              'assets/images/help.jpg',
              width: 350,
            ),
            Card(
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.email),
                title: text16("Email", dash),
                trailing: text16('mkvenkataraman@gmail.com', black),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.phone),
                title: text16("Phone", dash),
                trailing: text16('+91 9030353300', black),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.schedule),
                title: text16("email", dash),
                trailing: text16('MON - FRI, 10AM - 9PM', black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
