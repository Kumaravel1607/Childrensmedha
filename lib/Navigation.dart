import 'package:cmedha/Navi_Screen/CourseSelect.dart';
import 'package:cmedha/Navi_Screen/ExamSelect.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:cmedha/Navi_Screen/Course.dart';
import 'package:cmedha/Navi_Screen/Exam.dart';
import 'package:cmedha/Navi_Screen/Home.dart';
import 'package:cmedha/Navi_Screen/Resource.dart';
import 'package:cmedha/main.dart';
import 'package:cmedha/screens/Constant/color.dart';

class Navigation extends StatefulWidget {
  final String name;

  Navigation({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation>
    with SingleTickerProviderStateMixin {
  int _tabIndex = 0;
  PageController? pageController;
  ScrollController scrollController = ScrollController();
  bool _isNavBarVisible = true;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _tabIndex);
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          _isNavBarVisible = true;
        });
      } else if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          _isNavBarVisible = false;
        });
      }
    });
  }

  @override
  void dispose() {
    pageController!.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [];
        },
        body: PageView(
          controller: pageController,
          onPageChanged: (v) {
            setState(() {
              _tabIndex = v;
            });
          },
          children: [
            HomeScreen(user_name: widget.name),
            CourseSelect(),
            const ResourceScreen(),
            ExamSelect(),
          ],
        ),
      ),
      bottomNavigationBar: _isNavBarVisible
          ? CircleNavBar(
              activeIcons: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: SvgPicture.asset(
                    'assets/images/house1.svg',
                    width: 30,
                    height: 30,
                    color: white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: SvgPicture.asset(
                    'assets/images/book.svg',
                    width: 10,
                    height: 30,
                    color: white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: SvgPicture.asset(
                    'assets/images/bookmarks.svg',
                    width: 10,
                    height: 10,
                    color: white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: SvgPicture.asset(
                    'assets/images/exam.svg',
                    width: 10,
                    color: white,
                  ),
                ),
              ],
              inactiveIcons: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SvgPicture.asset(
                      'assets/images/house1.svg',
                      color: white,
                      height: 35,
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
                      height: 25,
                      width: 20,
                      color: white,
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
                      height: 20,
                      color: white,
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
                      height: 25,
                      color: white,
                    ),
                    const Text(
                      'Exams',
                      style: TextStyle(color: white),
                    )
                  ],
                ),
              ],
              color: Blue,
              height: 55,
              circleWidth: 45,
              activeIndex: _tabIndex,
              onTap: (index) {
                setState(() {
                  _tabIndex = index;
                });
                pageController!.jumpToPage(_tabIndex);
              },
              padding: const EdgeInsets.only(
                  left: 16, right: 16, bottom: 20, top: 10),
              cornerRadius: const BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
                bottomRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
            )
          : null,
    );
  }
}
