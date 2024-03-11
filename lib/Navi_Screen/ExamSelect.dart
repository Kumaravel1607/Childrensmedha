import 'package:cmedha/Navi_Screen/Course.dart';
import 'package:cmedha/Navi_Screen/Exam.dart';
import 'package:cmedha/screens/Constant/color.dart';
import 'package:cmedha/screens/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExamSelect extends StatefulWidget {
  const ExamSelect({Key? key}) : super(key: key);

  @override
  State<ExamSelect> createState() => _ExamSelectState();
}

class _ExamSelectState extends State<ExamSelect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Blue,
        automaticallyImplyLeading: false,
        shadowColor: black,
        title: text20('Select Exams', white),
        elevation: 3,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CourseCard(
              title: 'Competitive Exam',
              svgAsset: "assets/images/child.svg",
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (BuildContext context) => ExamScreen(type: 1),
                    ),
                    (Route<dynamic> route) => true);
              },
            ),
            SizedBox(height: 20),
            CourseCard(
              title: 'Others Exam',
              svgAsset: "assets/images/group.svg",
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (BuildContext context) => ExamScreen(type: 2),
                    ),
                    (Route<dynamic> route) => true);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => CourseScreen(type: 2),
                //   ),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String title;
  final String svgAsset;
  final VoidCallback onTap;

  CourseCard({
    required this.title,
    required this.svgAsset,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.all(10),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                svgAsset,
                width: 60,
                height: 60,
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
