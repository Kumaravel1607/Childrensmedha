import 'package:cmedha/screens/Constant/color.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
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
        title: const Text('About College',
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
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Vision",
                // textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 16, color: black, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              ReadMoreText(
                " To actively engage with and support the innovative learning and research of PES students, faculty, and staff.",
                preDataTextStyle:
                    TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                style: TextStyle(
                  color: Colors.black,
                ),
                colorClickableText: Blue,
                textAlign: TextAlign.justify,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'See more',
                trimExpandedText: '..See less',
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Mission",
                // textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 16, color: black, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              ReadMoreText(
                " To provide an innovative learning environment with technology, education and culture and to create a distinctive library experience through services and resources for students and faculty in their pursuit of academic excellence.",
                preDataTextStyle:
                    TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                style: TextStyle(color: Colors.black),
                colorClickableText: Blue,
                trimMode: TrimMode.Line,
                textAlign: TextAlign.justify,
                trimLines: 4,
                trimCollapsedText: 'See more',
                trimExpandedText: '..See less',
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "About us",
                // textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 16, color: black, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              ReadMoreText(
                " We have started this Childrens Medha Academy aiming to support the parents in mentoring their children enhance children skills and abilities mainly who are in age group between 10 to 15 years.  We make them ready to face multiple competetive exams at national and state level.  Our course curriculum helps children definitely to secure good rank in competative exams and Perticularly who are aiming for strong performnace and secure good ranks at national and state level competetive exams like SAINIK, RMS, RIMS and NAVODAYA etc in India",
                preDataTextStyle:
                    TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                style: TextStyle(color: Colors.black),
                colorClickableText: Blue,
                textAlign: TextAlign.justify,
                trimMode: TrimMode.Line,
                trimLines: 4,
                trimCollapsedText: 'See more',
                trimExpandedText: '..See less',
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Who We Are",
                // textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 16, color: black, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              ReadMoreText(
                "We have started this Childrens Medha Academy aiming to support the parents in mentoring their children enhance children skills and abilities mainly who are in age group between 10 to 15 years.  We make them ready to face multiple competetive exams at national and state level.  Our course curriculum helps children definitely to secure good rankin competative exams and Perticularly who are aiming for strong performnace and secure good ranks at national and state level competetive exams like SAINIK, RMS, RIMS and NAVODAYA etc in India",
                preDataTextStyle:
                    TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                style: TextStyle(color: Colors.black),
                colorClickableText: Blue,
                textAlign: TextAlign.justify,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'See more',
                trimLines: 10,
                trimExpandedText: '..See less',
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "What We Do",
                // textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 16, color: black, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              ReadMoreText(
                "We have started this Childrens Medha Academy aiming to support the parents in mentoring their children enhance children skills and abilities mainly who are in age group between 10 to 15 years.  We make them ready to face multiple competetive exams at national and state level.  Our course curriculum helps children definitely to secure good rankin competative exams and Perticularly who are aiming for strong performnace and secure good ranks at national and state level competetive exams like SAINIK, RMS, RIMS and NAVODAYA etc in India",
                preDataTextStyle:
                    TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                style: TextStyle(color: Colors.black),
                colorClickableText: Blue,
                textAlign: TextAlign.justify,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'See more',
                trimLines: 10,
                trimExpandedText: '..See less',
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
