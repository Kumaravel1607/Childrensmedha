import 'package:cmedha/screens/Constant/color.dart';
import 'package:cmedha/screens/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:readmore/readmore.dart';

class Course01 extends StatefulWidget {
  const Course01({super.key});

  @override
  State<Course01> createState() => _Course01State();
}

class Course {
  final String name;
  final String id;

  Course({
    required this.id,
    required this.name,
  });

  Course copyWith({String? name, bool? isFavorite}) =>
      Course(name: name ?? this.name, id: '');
}

final List<Course> CourseData = [
  Course(id: '1', name: 'Natural Numbers'),
  Course(id: '2', name: '	LCM and HCF'),
  Course(id: '3', name: 'Unitary Method'),
  Course(id: '4', name: 'Fractions'),
  Course(id: '5', name: 'Ratio and Proportion'),
  Course(id: '6', name: 'Profit and Loss'),
  Course(id: '7', name: 'Simplification'),
  Course(id: '8', name: 'Average'),
  Course(id: '9', name: 'Percentage'),
  Course(id: '10', name: 'Area and Perimeter'),
  Course(id: '11', name: 'Simple Interest'),
  Course(id: '12', name: 'Lines and Angles'),
  Course(id: '13', name: 'Complementary and Supplementary Angles'),
  Course(id: '14', name: 'Conversion of Units'),
  Course(id: '15', name: 'Roman Numerals'),
];

class _Course01State extends State<Course01> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // reverse: true,
      physics: NeverScrollableScrollPhysics(),
      //physics: AlwaysScrollableScrollPhysics(),
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text20('About', black),
                    SizedBox(
                      height: 10,
                    ),
                    text14(
                        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.',
                        black)
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: greylite,
                    // border: Border.all(color: grey),
                    borderRadius: BorderRadius.circular(5)),
                child: ListTile(
                  leading: text20('S.NO', black),
                  title: text20('Title', black),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 3,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: CourseData.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Column(
                          children: [
                            ListTile(
                              leading: text16(CourseData[index].id, black),
                              title: text16(CourseData[index].name, black),
                            ),
                            Divider(
                              thickness: 0.8,
                              height: 4,
                            )
                          ],
                        ));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//   final testData = [
//     "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
//     "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
//     "Lorem Ipsum is simply dummy text of the printing and typesetting industry"
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final _markDownData =
//         testData.map((x) => "- $x\n").reduce((x, y) => "$x$y");
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           text20('About', black),
//           const ReadMoreText(
//             'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.',
//             trimLines: 4,
//             style: TextStyle(color: Colors.black),
//             colorClickableText: Blue,
//             trimMode: TrimMode.Line,
//             trimCollapsedText: 'read more',
//             trimExpandedText: 'read less',
//             moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(
//             height: 5,
//           ),
//           text20('Requirements', black),
//           const SizedBox(
//             height: 0,
//           ),
//           SizedBox(
//             height: 150,
//             child: Markdown(
//               physics: const NeverScrollableScrollPhysics(),
//               data: _markDownData,
//             ),
//           ),
//           const SizedBox(
//             height: 5,
//           ),
//           text20('What we learn', black),
//           SizedBox(
//             height: 150,
//             child: Markdown(
//               softLineBreak: false,
//               physics: const NeverScrollableScrollPhysics(),
//               shrinkWrap: false,
//               data: _markDownData,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
