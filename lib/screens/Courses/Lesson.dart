import 'package:cmedha/screens/Constant/color.dart';
import 'package:cmedha/screens/widget.dart';
import 'package:flutter/material.dart';

class Course02 extends StatefulWidget {
  const Course02({super.key});

  @override
  State<Course02> createState() => _Course02State();
}

class Course {
  final String name;
  final String id;

  final bool isFavorite;

  Course({required this.id, required this.name, this.isFavorite = false});

  Course copyWith({String? name, bool? isFavorite}) => Course(
      name: name ?? this.name,
      isFavorite: isFavorite ?? this.isFavorite,
      id: '');
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

class _Course02State extends State<Course02> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      physics: NeverScrollableScrollPhysics(),
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
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
                height: MediaQuery.of(context).size.height * 2,
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
