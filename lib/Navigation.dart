import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:cmedha/main.dart';
import 'package:cmedha/screens/Constant/color.dart';
import 'package:cmedha/Navi_Screen/Course.dart';
import 'package:cmedha/Navi_Screen/Home.dart';
import 'package:cmedha/Navi_Screen/Exam.dart';
import 'package:cmedha/Navi_Screen/Session.dart';
import 'package:cmedha/Navi_Screen/Resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Navigation extends StatefulWidget {
  Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation>
    with SingleTickerProviderStateMixin {
  int _tabIndex = 0;
  int get tabIndex => _tabIndex;
  set tabIndex(int v) {
    _tabIndex = v;
    setState(() {});
  }

  PageController? pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _tabIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CircleNavBar(
        activeIcons: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: SvgPicture.asset(
              'assets/images/house.svg',
              color: black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6),
            child: SvgPicture.asset(
              'assets/images/book.svg',
              width: 10,
              height: 30,
              color: black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: SvgPicture.asset(
              'assets/images/bookmarks.svg',
              width: 10,
              height: 10,
              color: black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: SvgPicture.asset(
              'assets/images/exam.svg',
              width: 10,
              color: black,
            ),
          ),
        ],
        inactiveIcons: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset(
                'assets/images/house.svg',
                color: black,
                height: 30,
              ),
              const Text(
                'Home',
                style: TextStyle(color: white),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset(
                'assets/images/book.svg',
                height: 30,
                width: 20,
                color: black,
              ),
              const Text(
                'Course',
                style: TextStyle(color: white),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset(
                'assets/images/bookmarks.svg',
                height: 25,
                color: black,
              ),
              const Text(
                'Resource',
                style: TextStyle(color: white),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset(
                'assets/images/exam.svg',
                height: 30,
                color: black,
              ),
              const Text(
                'Exams',
                style: TextStyle(color: white),
              )
            ],
          ),
        ],
        color: Blue,
        height: 60,
        circleWidth: 45,
        activeIndex: tabIndex,

        onTap: (index) {
          tabIndex = index;
          pageController!.jumpToPage(tabIndex);
        },
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20, top: 5),
        cornerRadius: const BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
          bottomRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        ),
        //shadowColor: Colors.deepPurple,
        // elevation: 10,
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (v) {
          tabIndex = v;
        },
        children: [
          const HomeScreen(),
          const CourseScreen(),
          const ResourceScreen(),
          const ExamScreen(),
        ],
      ),
    );
  }
}
