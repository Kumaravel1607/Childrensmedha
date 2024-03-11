import 'dart:async';

import 'package:cmedha/Navigation.dart';
import 'package:cmedha/onboard.dart';
import 'package:cmedha/screens/Constant/color.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () async {
      SharedPreferences session = await SharedPreferences.getInstance();
      var email = session.getString('email');
      var username = session.getString('first_name');
      // var mobile = session.getString('phone');
      // var token = session.getString('token');
      print("-------");
      print(email);
      if (email == null || email == "") {
        // if (token != null) {

        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => OnBoardScreen()));
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Navigation(
                  name: username.toString(),
                )));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 100,
                width: 200,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Blue),
                backgroundColor: Colors.white,
                strokeWidth: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
