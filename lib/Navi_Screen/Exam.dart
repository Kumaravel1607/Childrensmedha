import 'package:cmedha/screens/Constant/color.dart';
import 'package:cmedha/screens/widget.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ExamScreen extends StatefulWidget {
  const ExamScreen({super.key});

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class Exam {
  final String des;
  final String name;
  final String image;

  final bool isFavorite;

  Exam({
    required this.name,
    required this.des,
    this.isFavorite = false,
    required this.image,
  });

  Exam copyWith({String? des, bool? isFavorite}) => Exam(
      des: des ?? this.des,
      isFavorite: isFavorite ?? this.isFavorite,
      name: '',
      image: '');
}

final List<Exam> ExamData = [
  Exam(
      name: 'SAINK',
      des:
          'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.',
      image: 'assets/images/exam.png'),
  Exam(
      name: 'RMIS',
      des:
          '	Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.',
      image: 'assets/images/exam.png'),
  Exam(
      name: 'NAVODAYA',
      des:
          'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.',
      image: 'assets/images/exam.png'),
  Exam(
      name: 'RMIS',
      des:
          'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.',
      image: 'assets/images/exam.png'),
];

class _ExamScreenState extends State<ExamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Blue,
        shadowColor: black,
        title: text20('Competitive Exam', white),
        elevation: 3,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          child: ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            itemCount: ExamData.length,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => CourseScreen(),
                  //         settings: RouteSettings(name: "/course")));
                  // Navigator.popUntil(context,
                  //     (route) => route.settings.name == "/course");
                  // Navigator.of(context).pushAndRemoveUntil(
                  //     MaterialPageRoute(
                  //         builder: (BuildContext context) =>
                  //             CourseScreen()),
                  //     (Route<dynamic> route) => true);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text20(ExamData[index].name, black),
                      const SizedBox(
                        height: 10,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          ExamData[index].image,
                          // "assets/images/course${index + 1}.png",

                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ReadMoreText(
                        ExamData[index].des,
                        trimLines: 7,
                        style: TextStyle(color: Colors.black),
                        colorClickableText: Blue,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'read more',
                        trimExpandedText: 'read less',
                        moreStyle: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Divider(
                        thickness: 5,
                        color: dash,
                        height: 10,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),

        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     const SizedBox(
        //       height: 5,
        //     ),
        //     text20('SAINK', black),
        //     const SizedBox(
        //       height: 10,
        //     ),
        //     const ReadMoreText(
        //       'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.',
        //       trimLines: 7,
        //       style: TextStyle(color: Colors.black),
        //       colorClickableText: Blue,
        //       trimMode: TrimMode.Line,
        //       trimCollapsedText: 'read more',
        //       trimExpandedText: 'read less',
        //       moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        //     ),
        //     const SizedBox(
        //       height: 10,
        //     ),
        //     text20('RMIS', black),
        //     const SizedBox(
        //       height: 10,
        //     ),
        //     const ReadMoreText(
        //       'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.',
        //       trimLines: 7,
        //       style: TextStyle(color: Colors.black),
        //       colorClickableText: Blue,
        //       trimMode: TrimMode.Line,
        //       trimCollapsedText: 'read more',
        //       trimExpandedText: 'read less',
        //       moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        //     ),
        //     const SizedBox(
        //       height: 10,
        //     ),
        //     text20('NAVODAYA', black),
        //     const SizedBox(
        //       height: 10,
        //     ),
        //     const ReadMoreText(
        //       'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.',
        //       trimLines: 7,
        //       style: TextStyle(color: Colors.black),
        //       colorClickableText: Blue,
        //       trimMode: TrimMode.Line,
        //       trimCollapsedText: 'read more',
        //       trimExpandedText: 'read less',
        //       moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
