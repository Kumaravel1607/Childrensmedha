import 'package:cmedha/Login.dart';
import 'package:cmedha/Navi_Screen/Session.dart';
import 'package:cmedha/screens/Constant/color.dart';
import 'package:cmedha/screens/menu/About.dart';
import 'package:cmedha/screens/menu/Changepassword.dart';
import 'package:cmedha/screens/menu/ExamAttempts.dart';
import 'package:cmedha/screens/menu/FAQ.dart';
import 'package:cmedha/screens/menu/Help.dart';
import 'package:cmedha/screens/menu/Logout.dart';
import 'package:cmedha/screens/menu/Mycourse.dart';
import 'package:cmedha/screens/menu/Purchase.dart';
import 'package:cmedha/screens/menu/Terms.dart';
import 'package:cmedha/screens/menu/cartpage.dart';
import 'package:cmedha/screens/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 243, 245, 246),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 5),
        child: ListView(
          children: <Widget>[
            Card(
                elevation: 2,
                color: const Color.fromARGB(255, 41, 42, 43),
                child: Container(
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5), BlendMode.dstATop),
                      image: const ExactAssetImage('assets/images/bg.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CircleAvatar(
                                radius: 35,
                                backgroundImage: NetworkImage(
                                    "https://randomuser.me/api/portraits/men/28.jpg")),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: white,
                                child: SvgPicture.asset(
                                  'assets/images/close.svg',
                                  height: 20,
                                  color: black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "Kums",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: white),
                        ),
                        const Text(
                          "kumsjo29@gmail.com",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: white),
                        ),
                      ],
                    ),
                  ),
                )),
            const Divider(
              thickness: 3,
              color: dash,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MyCoursePage()));
              },
              child: Card(
                  elevation: 5,
                  color: const Color.fromARGB(255, 244, 248, 253),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: white,
                          child: SvgPicture.asset(
                            'assets/images/exam.svg',
                            height: 30,
                            color: black,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        text16('My Course', black)
                      ],
                    ),
                  )),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SessionScreen()));
              },
              child: Card(
                  elevation: 5,
                  color: const Color.fromARGB(255, 244, 248, 253),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: white,
                          child: SvgPicture.asset(
                            'assets/images/bookmarks.svg',
                            height: 25,
                            color: black,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        text16('Sessions', black)
                      ],
                    ),
                  )),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const CartPage()));
              },
              child: Card(
                  elevation: 5,
                  color: const Color.fromARGB(255, 244, 248, 253),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: white,
                          child: SvgPicture.asset(
                            'assets/images/cart.svg',
                            height: 30,
                            color: black,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        text16('Cart', black)
                      ],
                    ),
                  )),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const FeedbackPage()));
              },
              child: Card(
                  elevation: 5,
                  color: const Color.fromARGB(255, 244, 248, 253),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: white,
                          child: SvgPicture.asset(
                            'assets/images/feedback.svg',
                            height: 25,
                            color: black,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        text16('Feedback', black)
                      ],
                    ),
                  )),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const FAQScreen()));
              },
              child: Card(
                  elevation: 5,
                  color: const Color.fromARGB(255, 244, 248, 253),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: white,
                          child: SvgPicture.asset(
                            'assets/images/faq.svg',
                            height: 30,
                            color: black,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        text16('FAQ', black)
                      ],
                    ),
                  )),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const TermsPage()));
              },
              child: Card(
                  elevation: 5,
                  color: const Color.fromARGB(255, 244, 248, 253),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: white,
                          child: SvgPicture.asset(
                            'assets/images/settings.svg',
                            height: 30,
                            color: black,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        text16('Terms and Conditions', black)
                      ],
                    ),
                  )),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const HelpPage()));
              },
              child: Card(
                  elevation: 5,
                  color: const Color.fromARGB(255, 244, 248, 253),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: white,
                          child: SvgPicture.asset(
                            'assets/images/headset.svg',
                            height: 30,
                            color: black,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        text16('Help and Support', black)
                      ],
                    ),
                  )),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const AboutPage()));
              },
              child: Card(
                  elevation: 5,
                  color: const Color.fromARGB(255, 244, 248, 253),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: white,
                          child: SvgPicture.asset(
                            'assets/images/help.svg',
                            height: 30,
                            color: black,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        text16('About', black)
                      ],
                    ),
                  )),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ChangePassword()));
              },
              child: Card(
                  elevation: 5,
                  color: const Color.fromARGB(255, 244, 248, 253),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: white,
                          child: SvgPicture.asset(
                            'assets/images/unlock.svg',
                            height: 25,
                            color: black,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        text16('Change Password', black)
                      ],
                    ),
                  )),
            ),
            GestureDetector(
              onTap: () {
                logOut();
              },
              child: Card(
                  elevation: 5,
                  color: const Color.fromARGB(255, 244, 248, 253),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: white,
                          child: SvgPicture.asset(
                            'assets/images/logout.svg',
                            height: 30,
                            color: black,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        text16('Logout', black)
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text(
        "Cancel",
        style:
            TextStyle(color: Blue, fontSize: 16, fontWeight: FontWeight.w600),
      ),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
        // Navigator.pop(context);
        //Navigator.of(context).pop();
        // Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
        //   MaterialPageRoute(
        //     builder: (BuildContext context) {
        //       return DashBoard_Screen();
        //     },
        //   ),
        //   (_) => false,
        // );
      },
    );
    Widget continueButton = TextButton(
      child: Text(
        "Logout",
        style:
            TextStyle(color: Blue, fontSize: 16, fontWeight: FontWeight.w600),
      ),
      onPressed: () async {
        Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return LoginScreen();
            },
          ),
          (_) => false,
        );
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Logout",
        style: TextStyle(
            fontFamily: 'Poppins',
            color: black,
            fontSize: 20,
            fontWeight: FontWeight.w700),
      ),
      content: Text(
        "Do you Really want to logout?",
        style: TextStyle(
            fontFamily: 'Poppins',
            color: black,
            fontSize: 16,
            fontWeight: FontWeight.w500),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  logOut() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are you sure?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('We will be redirected to login page.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return LoginScreen();
                    },
                  ),
                  (_) => false,
                );
                // Navigator.of(context).pop(); // Navigate to login
              },
            ),
          ],
        );
      },
    );
  }
}
