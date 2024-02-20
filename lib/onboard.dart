import 'package:cmedha/Login.dart';
import 'package:cmedha/Navigation.dart';
import 'package:cmedha/Register.dart';
import 'package:cmedha/screens/Constant/color.dart';
import 'package:cmedha/screens/widget.dart';
import 'package:flutter/material.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  color: Blue,
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: white,
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(88))),
                  child: Center(
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 300,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 540,
            child: Stack(
              children: [
                Container(
                  color: white,
                ),
                Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Blue,
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(88))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 75),
                      child: Column(
                        children: [
                          const Text(
                            "There's a lot happenning around you !",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: white,
                              fontSize: 25,
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Find materials around you \nyou can search and buy material as you with ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: white,
                              fontSize: 16,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
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
                                minimumSize: const Size.fromHeight(50),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                              },
                              child: const Text(
                                'Sign in',
                                style: TextStyle(
                                  color: Blue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 16),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                      width: 2,
                                      color: white,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                backgroundColor: Blue,
                                minimumSize: const Size.fromHeight(50),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => RegisterScreen()));
                              },
                              child: const Text(
                                'Register',
                                style: TextStyle(
                                  color: white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
